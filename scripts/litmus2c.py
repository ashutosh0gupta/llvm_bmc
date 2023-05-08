#!/usr/bin/python3

import os
import sys
from enum import Enum

#############################################
#          litmus2c          #
# ========================================= #
# Translates an input AArch64 multi-thread- #
# ed litmus program to a concurrent C       #
# program                                   #
#############################################

# infile = os.path.join(os.getcwd(), sys.argv[1])
# outfile = os.path.join(os.getcwd(), sys.argv[2])
infile = "/home/akg/research/shared/krishna/parosh-arm/alltests/sb+rel-o+rel-o.litmus"
outfile = "/tmp/tmp.cpp"

class InstrType(Enum):
  LD = 1
  LDA = 2
  LDX = 3
  LDAX = 4
  ST = 5
  STL = 6
  STX = 7
  STLX = 8
  ASSIGN = 9
  DMBSY = 10
  ISB = 11
  DMBLD = 12
  DMBST = 13
  LABEL = 14
  ACI = 15

class Expression:
  # A simple class for an expression
  # Holds the types and values of two operands, and the operation in the string form
  # Type 0 = register, type 1 = integer, and type -1 = does not exist
  def __init__(self, type1, val1, type2=-1, val2=-1, op=-1):
    self.type1 = type1
    self.type2 = type2
    self.val1 = val1
    self.val2 = val2
    self.op = op

  def get_regs(self):
    # returns the list of used registers
    regs = []
    if (self.type1 == 0):
      regs.append(self.val1)
    if (self.type2 == 0):
      regs.append(self.val2)
    return regs

  def get_exp(self, p):
    # returns the expression in string form, given the process
    if (self.type2 == -1):
      # only one argument
      if (self.type1 == 0):
        ret = f"r{self.val1}"
        # ret = f"REGP({p},{self.val1})"
      else:
        ret = str(self.val1)
    else:
      ret = "("
      if (self.type1 == 0):
        ret += f"REGP({p},{self.val1})"
      else:
        ret += str(self.val1)
      ret += " " + str(self.op) + " "
      if (self.type2 == 0):
        ret += f"REGP({p},{self.val2})"
      else:
        ret += str(self.val2)
      ret += ")"
    return ret

  def __str__(self):
    return self.get_exp('?')

class Instruction:
  def __init__(self, p, i_type, op1=None, op2=None, op3=None):
    self.p = p
    self.i_type = i_type
    self.op1 = op1
    self.op2 = op2
    self.op3 = op3

  def __str__(self):
    s = str(self.p) + " "
    if(self.i_type == 1):
      s = s + "LD"
    if(self.i_type == 2):
      s = s + "LDA"
    if(self.i_type == 3):
      s = s + "LDX"
    if(self.i_type == 4):
      s = s + "LDAX"
    if(self.i_type == 5):
      s = s + "ST"
    if(self.i_type == 6):
      s = s + "STL"
    if(self.i_type == 7):
      s = s + "STX"
    if(self.i_type == 8):
      s = s + "STLX"
    if(self.i_type == 9):
      s = s + "ASSIGN"
    if(self.i_type == 10):
      s = s + "DMBSY"
    if(self.i_type == 11):
      s = s + "ISB"
    if(self.i_type == 12):
      s = s + "DMBLB"
    if(self.i_type == 13):
      s = s + "DMBST"
    if(self.i_type == 14):
      s = s + "LABEL"
    if(self.i_type == 15):
      s = s + "ACI"
    # str(self.i_type)
    if( self.op1 != None ):
      s = s + " " + str(self.op1)
    if( self.op2 != None ):
        s = s + " " + str(self.op2)
    if( self.op3 != None ):
        s = s + " " + str(self.op3)
    return s
    
#-----------------------------------------------------------------------
#
# Remove following encodings
#

ncontext = 10 # later read in as argument
# ncontext = 50 # for complete testing only

#-----------------------------------------------------------------------
# Data structure to store litmus program

nproc = 0
nregs = 16
addrsize = 64
incode = []
init_addr_with_zeros = True              # whether to initialize addr with zeroes
init_reg = []
init_addr_diff = {}
final_conds = []                  # final conditions
countproc = []

def print_program():
  print(infile)
  print(nregs)
  print(addrsize)
  for tcode in incode:
    for inst in tcode:      
      print(inst)
  print(init_addr_with_zeros)
  print("Reg init")
  print(init_reg)
  print("Inite addr")
  print(init_addr_diff)
  print("Spec")
  print(final_conds)
  print(countproc)

#-----------------------------------------------------------------------
# Parsing input

def parse_from_litmus(ifile):
  global nproc, incode, countproc, nregs, addrsize
  var_set = set()                    # global variable list
  process_local_regs = []            # process local register list
  mem_mapping = {}                   # variables to values
  process_local_mapping = []         # registers to variable (addresses)  
  
  process_reg_nums = []              # number of per-proc registers
  process_reg_to_num_map = []        # assign numbers to registers    
  var_to_addr_map = {}               # global variable to address mapping  

  init_conds = []                    # global var initial values
  toresolve = []

  process_private_regs = []

  with open(ifile) as f:
    content = [x.strip() for x in f.readlines()]
  cur_index = 0
  
  # find the '{'
  while content[cur_index] != "{":
    cur_index += 1
  cur_index += 1

  while content[cur_index] != "}":
    thisline = [part.strip() for part in content[cur_index].split(';')[:-1]]
    # print(thisline)

    for part in thisline:
      if ':' in part:                # register initial values
        subparts1 = part.split(':')
        index = int(subparts1[0])        # which process
        subparts2 = subparts1[1].split('=')    
        while nproc <= index:
          countproc.append(0)
          process_local_regs.append(set())
          process_local_mapping.append({})
          process_reg_to_num_map.append({})
          incode.append([])
          process_reg_nums.append(2)      # register 0,1 are "private" registers for CMP stmts
          process_private_regs.append(-1)
          nproc += 1

        process_local_regs[index].add(subparts2[0][1:])
        var_set.add(subparts2[1])
        process_local_mapping[index][subparts2[0][1:]] = subparts2[1]
      else:                    # variable initial values
        subparts = part.split('=')
        var_set.add(subparts[0])
        if (subparts[1]).isnumeric():
          mem_mapping[subparts[0]] = int(subparts[1])
        else:
          var_set.add(subparts[1])
          mem_mapping[subparts[0]] = subparts[1]
          toresolve.append(subparts[0])
    cur_index += 1

  cur_index += 2                     # skip over the '}' and PO|P1|... lines

  vind = 0
  for var in var_set:
    var_to_addr_map[var] = vind
    vind += 1

  for var in toresolve:
    mem_mapping[var] = var_to_addr_map[mem_mapping[var]]

  # assign local registers numbers - this may miss some
  # registers that we will find first referred to in the code.
  # But for them, we'll simply allocate higher counts on-the-fly
  for proc in range(nproc):
    for reg in process_local_regs[proc]:
      process_reg_to_num_map[proc][reg] = process_reg_nums[proc]
      process_reg_nums[proc] += 1
    
    # Add register assignments to output code
    init_reg.append({})
    for reg, var in process_local_mapping[proc].items():
      # istmt = f"REGP({proc},{process_reg_to_num_map[proc][reg]}) = {var_to_addr_map[var]};"
      # init_reg.append(istmt)
      istmt = f"{var_to_addr_map[var]}"
      init_reg[proc][process_reg_to_num_map[proc][reg]] = istmt

  while not content[cur_index].startswith("exists"):
    if content[cur_index] == '':
      cur_index += 1
      continue
    parts = [part.strip() for part in content[cur_index][:-1].split('|')]
    for proc in range(nproc):
      # need to remove spaces
      # print(proc)
      # print(parts)
      # sys.stdout.flush()
      part = parts[proc].split(' ')
      part[:] = [x for x in part if x]
      if len(part) == 0:
        part = ['']
      operation = part[0]
      if ':' in operation:
        # label
        stmt = Instruction(proc, InstrType.LABEL.value, operation[:-1])
        incode[proc].append(stmt)
        if len(part) == 1:
          operation = ''        # so that the file isn't blacklisted
        else:
          part = part[1:]
          operation = part[0]
      if operation in ['ISB','NOP','']:
        operands = ['']
      else:
        operands =  part[1].split(',')
        if len(operands) == 2 and not operands[1]:
          operands[1] = part[2]

      # these litmus tests have very simple addresses - simple locations

      if operation in ['LDR','LDAR','LDAXR','LDXR']:
        operands[0] = operands[0][1:]
        if len(operands) > 2:
          # has the offset and stuff
          operands[1] = operands[1][2:]
          if ']' in operands[2]:
            operands[2] = operands[2][1:-1]
          else:
            operands[2] = operands[2][1:]
          # Now add an assign statement to the private register
          # followed by a load
          for operand in operands:
            if operand not in process_local_regs[proc]:
              process_local_regs[proc].add(operand)
              process_reg_to_num_map[proc][operand] = process_reg_nums[proc]
              process_reg_nums[proc] += 1
          if process_private_regs[proc] == -1:
            process_private_regs[proc] = process_reg_nums[proc]
            process_reg_nums[proc] += 1
          exp = Expression(0, process_reg_to_num_map[proc][operands[1]]  \
            , 0, process_reg_to_num_map[proc][operands[2]],'+')
          stmt1 = Instruction(proc, InstrType.ASSIGN.value, process_private_regs[proc], exp)
          stmt2 = Instruction(proc, InstrType[operation[:-1]].value,   \
            process_reg_to_num_map[proc][operands[0]],  \
            process_private_regs[proc])
          incode[proc].append(stmt1)
          incode[proc].append(stmt2)
        else:
          operands[1] = operands[1][2:-1]
          for operand in operands:
            if operand not in process_local_regs[proc]:
              process_local_regs[proc].add(operand)
              process_reg_to_num_map[proc][operand] = process_reg_nums[proc]
              process_reg_nums[proc] += 1
          stmt = Instruction(proc, InstrType[operation[:-1]].value,   \
            process_reg_to_num_map[proc][operands[0]],  \
            process_reg_to_num_map[proc][operands[1]])
          incode[proc].append(stmt)
      elif operation in ['STR', 'STLR']:
        operands[0] = operands[0][1:]
        if len(operands) > 2:
          # has the offset and stuff
          operands[1] = operands[1][2:]
          if ']' in operands[2]:
            operands[2] = operands[2][1:-1]
          else:
            operands[2] = operands[2][1:]
          # Now add an assign statement to the private register
          # followed by a load
          for operand in operands:
            if operand not in process_local_regs[proc]:
              process_local_regs[proc].add(operand)
              process_reg_to_num_map[proc][operand] = process_reg_nums[proc]
              process_reg_nums[proc] += 1
          if process_private_regs[proc] == -1:
            process_private_regs[proc] = process_reg_nums[proc]
            process_reg_nums[proc] += 1
          exp = Expression(0, process_reg_to_num_map[proc][operands[1]]  \
            , 0, process_reg_to_num_map[proc][operands[2]],'+')
          stmt1 = Instruction(proc, InstrType.ASSIGN.value, process_private_regs[proc], exp)
          stmt2 = Instruction(proc, InstrType[operation[:-1]].value,   \
            process_private_regs[proc], process_reg_to_num_map[proc][operands[0]])
          incode[proc].append(stmt1)
          incode[proc].append(stmt2)
        else:
          operands[1] = operands[1][2:-1]
          for operand in operands:
            if operand not in process_local_regs[proc]:
              process_local_regs[proc].add(operand)
              process_reg_to_num_map[proc][operand] = process_reg_nums[proc]
              process_reg_nums[proc] += 1
          stmt = Instruction(proc, InstrType[operation[:-1]].value,  \
            process_reg_to_num_map[proc][operands[1]], process_reg_to_num_map[proc][operands[0]])
          incode[proc].append(stmt)
      elif operation in ['STXR', 'STLXR']:
        operands[0] = operands[0][1:]
        operands[1] = operands[1][1:]
        operands[2] = operands[2][2:-1]
        for operand in operands:
          if operand not in process_local_regs[proc]:
            process_local_regs[proc].add(operand)
            process_reg_to_num_map[proc][operand] = process_reg_nums[proc]
            process_reg_nums[proc] += 1
        stmt = Instruction(proc, InstrType[operation[:-1]].value,  \
          process_reg_to_num_map[proc][operands[0]], process_reg_to_num_map[proc][operands[2]],  \
          process_reg_to_num_map[proc][operands[1]])
        incode[proc].append(stmt)
      elif operation == "DMB":
        stmt = Instruction(proc, InstrType[operation+operands[0]].value)
        incode[proc].append(stmt)
      elif operation == "ISB":
        stmt = Instruction(proc, InstrType.ISB.value)
        incode[proc].append(stmt)
      elif operation == "MOV":
        operands[0] = operands[0][1:]
        if operands[0] not in process_local_regs[proc]:
          process_local_regs[proc].add(operands[0])
          process_reg_to_num_map[proc][operands[0]] = process_reg_nums[proc]
          process_reg_nums[proc] += 1

        if operands[1][0] == '#': 
          exp = Expression(1, int(operands[1][1:]))
          stmt = Instruction(proc, InstrType.ASSIGN.value,  \
            process_reg_to_num_map[proc][operands[0]], exp)
        else:
          operands[1] = operands[1][1:]
          if operands[1] not in process_local_regs[proc]:
            process_local_regs[proc].add(operands[1])
            process_reg_to_num_map[proc][operands[1]] = process_reg_nums[proc]
            process_reg_nums[proc] += 1
          exp = Expression(0, process_reg_to_num_map[proc][operands[1]])
          stmt = Instruction(proc, InstrType.ASSIGN.value,  \
            process_reg_to_num_map[proc][operands[0]], exp)
        incode[proc].append(stmt)
      elif operation == "CMP":
        if operands[0][0] == '#':
          exp = Expression(1, int(operands[0][1:]))
          stmt1 = Instruction(proc, InstrType.ASSIGN.value, 0, exp)
        else:
          operands[0] = operands[0][1:]
          if operands[0] not in process_local_regs[proc]:
            process_local_regs[proc].add(operands[0])
            process_reg_to_num_map[proc][operands[0]] = process_reg_nums[proc]
            process_reg_nums[proc] += 1
          exp = Expression(0, process_reg_to_num_map[proc][operands[0]])
          stmt1 = Instruction(proc, InstrType.ASSIGN.value, 0, exp)
        if operands[1][0] == '#':
          exp = Expression(1, int(operands[1][1:]))
          stmt2 = Instruction(proc, InstrType.ASSIGN.value, 1, exp)
        else:
          operands[1] = operands[1][1:]
          if operands[1] not in process_local_regs[proc]:
            process_local_regs[proc].add(operands[1])
            process_reg_to_num_map[proc][operands[1]] = process_reg_nums[proc]
            process_reg_nums[proc] += 1
          exp = Expression(0, process_reg_to_num_map[proc][operands[1]])
          stmt2 = Instruction(proc, InstrType.ASSIGN.value, 1, exp)
        incode[proc].append(stmt1)
        incode[proc].append(stmt2)
      elif operation in ["B.EQ", "B.GE", "B.NE", "B.GT"]:
        stmt = Instruction(proc, InstrType.ACI.value, operation[0]+operation[2:],  \
          operands[0])
        incode[proc].append(stmt)
      elif operation == "B":
        stmt = Instruction(proc, InstrType.ACI.value, operation, operands[0])
        incode[proc].append(stmt)
      elif operation == "EOR":
        operands[0] = operands[0][1:]
        if operands[0] not in process_local_regs[proc]:
          process_local_regs[proc].add(operands[0])
          process_reg_to_num_map[proc][operands[0]] = process_reg_nums[proc]
          process_reg_nums[proc] += 1
        if operands[1][0] == '#':
          type1 = 1
          operands[1] = int(operands[1][1:])
          op1 = operands[1]
        else:
          type1 = 0
          operands[1] = operands[1][1:]
          if operands[1] not in process_local_regs[proc]:
            process_local_regs[proc].add(operands[1])
            process_reg_to_num_map[proc][operands[1]] = process_reg_nums[proc]
            process_reg_nums[proc] += 1
          op1 = process_reg_to_num_map[proc][operands[1]]
        if operands[2][0] == '#':
          type2 = 1
          operands[2] = int(operands[2][1:])
          op2 = operands[2]
        else:
          type2 = 0
          operands[2] = operands[2][1:]
          if operands[2] not in process_local_regs[proc]:
            process_local_regs[proc].add(operands[2])
            process_reg_to_num_map[proc][operands[2]] = process_reg_nums[proc]
            process_reg_nums[proc] += 1
          op2 = process_reg_to_num_map[proc][operands[2]]
        exp = Expression(type1, op1, type2,  op2, '^')
        stmt = Instruction(proc, InstrType.ASSIGN.value,  \
          process_reg_to_num_map[proc][operands[0]], exp)
        incode[proc].append(stmt)
      elif operation == "ADD":
        operands[0] = operands[0][1:]
        if operands[0] not in process_local_regs[proc]:
          process_local_regs[proc].add(operands[0])
          process_reg_to_num_map[proc][operands[0]] = process_reg_nums[proc]
          process_reg_nums[proc] += 1
        if operands[1][0] == '#':
          type1 = 1
          operands[1] = int(operands[1][1:])
          op1 = operands[1]
        else:
          type1 = 0
          operands[1] = operands[1][1:]
          if operands[1] not in process_local_regs[proc]:
            process_local_regs[proc].add(operands[1])
            process_reg_to_num_map[proc][operands[1]] = process_reg_nums[proc]
            process_reg_nums[proc] += 1
          op1 = process_reg_to_num_map[proc][operands[1]]
        if operands[2][0] == '#':
          type2 = 1
          operands[2] = int(operands[2][1:])
          op2 = operands[2]
        else:
          type2 = 0
          operands[2] = operands[2][1:]
          if operands[2] not in process_local_regs[proc]:
            process_local_regs[proc].add(operands[2])
            process_reg_to_num_map[proc][operands[2]] = process_reg_nums[proc]
            process_reg_nums[proc] += 1
          op2 = process_reg_to_num_map[proc][operands[2]]
        exp = Expression(type1, op1, type2,  op2, '+')
        stmt = Instruction(proc, InstrType.ASSIGN.value,  \
          process_reg_to_num_map[proc][operands[0]], exp)
        incode[proc].append(stmt)
      elif operation == "SUB":
        operands[0] = operands[0][1:]
        if operands[0] not in process_local_regs[proc]:
          process_local_regs[proc].add(operands[0])
          process_reg_to_num_map[proc][operands[0]] = process_reg_nums[proc]
          process_reg_nums[proc] += 1
        if operands[1][0] == '#':
          type1 = 1
          operands[1] = int(operands[1][1:])
          op1 = operands[1]
        else:
          type1 = 0
          operands[1] = operands[1][1:]
          if operands[1] not in process_local_regs[proc]:
            process_local_regs[proc].add(operands[1])
            process_reg_to_num_map[proc][operands[1]] = process_reg_nums[proc]
            process_reg_nums[proc] += 1
          op1 = process_reg_to_num_map[proc][operands[1]]
        if operands[2][0] == '#':
          type2 = 1
          operands[2] = int(operands[2][1:])
          op2 = operands[2]
        else:
          type2 = 0
          operands[2] = operands[2][1:]
          if operands[2] not in process_local_regs[proc]:
            process_local_regs[proc].add(operands[2])
            process_reg_to_num_map[proc][operands[2]] = process_reg_nums[proc]
            process_reg_nums[proc] += 1
          op2 = process_reg_to_num_map[proc][operands[2]]
        exp = Expression(type1, op1, type2,  op2, '-')
        stmt = Instruction(proc, InstrType.ASSIGN.value,  \
          process_reg_to_num_map[proc][operands[0]], exp)
        incode[proc].append(stmt)
      elif operation == "MUL":
        operands[0] = operands[0][1:]
        if operands[0] not in process_local_regs[proc]:
          process_local_regs[proc].add(operands[0])
          process_reg_to_num_map[proc][operands[0]] = process_reg_nums[proc]
          process_reg_nums[proc] += 1
        if operands[1][0] == '#':
          type1 = 1
          operands[1] = int(operands[1][1:])
          op1 = operands[1]
        else:
          type1 = 0
          operands[1] = operands[1][1:]
          if operands[1] not in process_local_regs[proc]:
            process_local_regs[proc].add(operands[1])
            process_reg_to_num_map[proc][operands[1]] = process_reg_nums[proc]
            process_reg_nums[proc] += 1
          op1 = process_reg_to_num_map[proc][operands[1]]
        if operands[2][0] == '#':
          type2 = 1
          operands[2] = int(operands[2][1:])
          op2 = operands[2]
        else:
          type2 = 0
          operands[2] = operands[2][1:]
          if operands[2] not in process_local_regs[proc]:
            process_local_regs[proc].add(operands[2])
            process_reg_to_num_map[proc][operands[2]] = process_reg_nums[proc]
            process_reg_nums[proc] += 1
          op2 = process_reg_to_num_map[proc][operands[2]]
        exp = Expression(type1, op1, type2,  op2, '*')
        stmt = Instruction(proc, InstrType.ASSIGN.value,  \
          process_reg_to_num_map[proc][operands[0]], exp)
        incode[proc].append(stmt)
      elif operation == "CBZ":
        operands[0] = operands[0][1:]
        if operands[0] not in process_local_regs[proc]:
          process_local_regs[proc].add(operands[0])
          process_reg_to_num_map[proc][operands[0]] = process_reg_nums[proc]
          process_reg_nums[proc] += 1
        stmt = Instruction(proc, InstrType.ACI.value, "CBZ",  \
          process_reg_to_num_map[proc][operands[0]], operands[1])
        incode[proc].append(stmt)
      elif operation == "CBNZ":
        operands[0] = operands[0][1:]
        if operands[0] not in process_local_regs[proc]:
          process_local_regs[proc].add(operands[0])
          process_reg_to_num_map[proc][operands[0]] = process_reg_nums[proc]
          process_reg_nums[proc] += 1
        stmt = Instruction(proc, InstrType.ACI.value, "CBNZ",  \
          process_reg_to_num_map[proc][operands[0]], operands[1])
        incode[proc].append(stmt)
    cur_index += 1

  for var, value in mem_mapping.items():
    init_addr_diff[var_to_addr_map[var]] = value

  # extract the conditions
  # for now we support ONLY and symbols (/\): if you want OR symbols,
  # you're out of luck
  if content[cur_index] == "exists":
    cur_index += 1
    conditions = content[cur_index][1:-1].split('/')
  else:
    line = content[cur_index][6:].strip()
    conditions = line[1:-1].split('/')
  for condition in conditions:
    if condition[0] == '\\':
      # lingering '\' from the /\
      condition = condition[1:]
    condition = condition.strip()
    if ':' in condition:
      # local constraint on a register
      # Format: LOCAL <PROCID> <REGNO> <EXPECTED_VALUE>
      parts = condition.split(':')
      proc = int(parts[0])
      subparts = parts[1].split('=')
      subparts[0] = subparts[0][1:]
      if not (subparts[1]).isnumeric():
        subparts[1] = var_to_addr_map[subparts[1]]
      if subparts[0] not in process_local_regs[proc]:
        process_local_regs[proc].add(subparts[0])
        process_reg_to_num_map[proc][subparts[0]] = process_reg_nums[proc]
        process_reg_nums[proc] += 1

      # istmt = f"(REGP({proc},{process_reg_to_num_map[proc][subparts[0]]}) == {int(subparts[1])})"
      istmt = f"(result{proc}{process_reg_to_num_map[proc][subparts[0]]} == {int(subparts[1])})"
      final_conds.append(istmt)
    else:
      # global constraint on a variable
      # Format: GLOBAL <ADDRESS> <EXPECTED_VALUE>
      parts = condition.split('=')

      if parts[0] not in var_set:
        var_set.add(parts[0])
        var_to_addr_map = vind
        vind += 1

      istmt = f"(MU({var_to_addr_map[parts[0]]},NCONTEXT-1) == {int(parts[1])})"
      final_conds.append(istmt)

  # modify global vars
  nregs = 0
  addrsize = vind
  for proc in range(nproc):
    nregs = max(nregs, process_reg_nums[proc])


#-----------------------------------------------------------------------
# Code generation

code = []

def add_indented_code(line, indentlevel=0):
  ### Add code with the given level of indentation ###
  # One indent is assumed to be 4 spaces
  code.append((" "*4*indentlevel)+line)

def add_preamble(indentlevel=0):
  ### Preamble code ### 

  # Add macros for number of registers and address size
  add_indented_code("#define NREGS "+str(nregs), indentlevel)
  add_indented_code("#define ADDRSIZE "+str(addrsize), indentlevel)
  init_vec = ['0'] * addrsize
  for i in init_addr_diff:
    init_vec[i] = str(init_addr_diff[i])
  init_str = "{"+', '.join(init_vec) +"}"
  add_indented_code("int memory[ADDRSIZE] = "+init_str+";", indentlevel)
  add_indented_code("", indentlevel)
  add_indented_code("bool assert(bool);", indentlevel)
  add_indented_code("bool assume(bool);", indentlevel)
  add_indented_code("void dmbsy();", indentlevel)
  add_indented_code("void str (int *, int);", indentlevel)
  add_indented_code("void stl (int *, int);", indentlevel)
  add_indented_code("void stx (int *, int);", indentlevel)
  add_indented_code("void stlx(int *, int);", indentlevel)
  add_indented_code("int ldr (int *);", indentlevel)
  add_indented_code("int lda (int *);", indentlevel)
  add_indented_code("int ldx (int *);", indentlevel)
  add_indented_code("int ldax(int *);", indentlevel)
  add_indented_code("", indentlevel)
 
def add_control(p, indentlevel=0):
  add_indented_code(f"ctrl[{p}] = ctrl[{p}] + get_rng(0,NCONTEXT-1);", indentlevel)
  add_indented_code(f"ASSUME(ctrl[{p}] < NCONTEXT);", indentlevel)
  add_indented_code("", indentlevel)

def add_ST(p, rprime, r, indentlevel=0):
  add_indented_code(f"*(memory + r{rprime}) = r{r};// ST", indentlevel)  

def add_STL(p, rprime, r, indentlevel=0):
  add_indented_code(f"stl(memory + r{rprime}, r{r});// STL", indentlevel)

def add_STX(p, rdoubleprime, rprime, r, indentlevel=0):
  add_indented_code(f"stx(memory + r{rprime}, r{r});// STL", indentlevel)

def add_STLX(p, rdoubleprime, rprime, r, indentlevel=0):
  add_indented_code(f"stlx(memory + r{rprime}, r{r});// STL", indentlevel)

def add_assign(p, r, exp, indentlevel=0):
  add_indented_code(f"r{r} = "  + exp.get_exp(p) + "; // ASSIGN", indentlevel)

def add_LD(p, rprime, r, indentlevel=0):
  add_indented_code(f"r{rprime} = *(memory + r{r});// LD", indentlevel)

def add_LDA(p, rprime, r, indentlevel=0):
  add_indented_code(f"r{rprime} = lda(memory + r{r});// LDA", indentlevel)

def add_LDX(p, rprime, r, indentlevel=0):
  add_indented_code(f"r{rprime} = lda(memory + r{r});// LDX", indentlevel)


def add_LDAX(p, rprime, r, indentlevel=0):
  add_indented_code(f"r{rprime} = ldax(memory + {r});// LDAX", indentlevel)
  
def add_spec(indentlevel=0):
  add_indented_code("//// Specification", indentlevel)
  add_indented_code("//// assert(", indentlevel)
  for cnd in final_conds:
    add_indented_code("//// " + cnd + " &&", indentlevel+1)
  add_indented_code("/// 1)", indentlevel)
  add_indented_code("ASSERT(0);", indentlevel+1)
  add_indented_code("", indentlevel)

def add_dmb_sy(p, indentlevel=0):
  add_indented_code("/* dmb.sy */", indentlevel)
  add_indented_code("// Guess", indentlevel)
  add_indented_code(f"old_cDY = cDY[{p}];", indentlevel)
  add_indented_code(f"cDY[{p}] = get_rng(0,NCONTEXT-1);", indentlevel)
  add_indented_code("// Check", indentlevel)
  add_indented_code(f"ASSUME(cDY[{p}] >= old_cDY);", indentlevel)
  add_indented_code(f"ASSUME(cDY[{p}] >= max(cISB[{p}],cDL[{p}]));", indentlevel)
  add_indented_code(f"ASSUME(cDY[{p}] >= max(cDS[{p}],ctrl[{p}]));", indentlevel)
  # cL and cS are <= cR and cW respectively
  add_indented_code("for (int x = 0; x < ADDRSIZE; x++) {", indentlevel)
  add_indented_code(f"ASSUME(cDY[{p}] >= CW({p},x));", indentlevel+1)
  add_indented_code(f"ASSUME(cDY[{p}] >= CR({p},x));", indentlevel+1)
  add_indented_code("}", indentlevel)
  add_indented_code("", indentlevel)

def add_isb(p, indentlevel=0):
  add_indented_code("/* isb */", indentlevel)
  add_indented_code("// Guess", indentlevel)
  add_indented_code(f"cISB[{p}] = get_rng(0,NCONTEXT-1);", indentlevel)
  add_indented_code("// Check", indentlevel)
  add_indented_code(f"ASSUME(cISB[{p}] >= cDY[{p}]);", indentlevel)
  add_indented_code(f"ASSUME(cISB[{p}] >= ctrl[{p}]);", indentlevel)
  # we need all po-prev instructions to have fully defined memory footprints
  # time to use cAddr
  add_indented_code(f"ASSUME(cISB[{p}] >= cAddr[{p}]);", indentlevel)
  add_indented_code("", indentlevel)

def add_dmb_ld(p, indentlevel=0):
  add_indented_code("/* dmb.ld */", indentlevel)
  add_indented_code("// Guess", indentlevel)
  add_indented_code(f"cDL[{p}] = get_rng(0,NCONTEXT-1);", indentlevel)
  add_indented_code("// Check", indentlevel)
  add_indented_code(f"ASSUME(cDL[{p}] >= cDY[{p}]);", indentlevel)
  # cL and cS are <= cR and cW respectively
  add_indented_code("for (int x = 0; x < ADDRSIZE; x++) {", indentlevel)
  add_indented_code(f"ASSUME(cDL[{p}] >= CR({p},x));", indentlevel+1)
  add_indented_code("}", indentlevel)
  add_indented_code("", indentlevel)


def add_dmb_st(p, indentlevel=0):
  add_indented_code("/* dmb.st */", indentlevel)
  add_indented_code("// Guess", indentlevel)
  add_indented_code(f"cDS[{p}] = get_rng(0,NCONTEXT-1);", indentlevel)
  add_indented_code("// Check", indentlevel)
  add_indented_code(f"ASSUME(cDS[{p}] >= cDY[{p}]);", indentlevel)
  # cL and cS are <= cR and cW respectively
  add_indented_code("for (int x = 0; x < ADDRSIZE; x++) {", indentlevel)
  add_indented_code(f"ASSUME(cDS[{p}] >= CW({p},x));", indentlevel+1)
  add_indented_code("}", indentlevel)
  add_indented_code("", indentlevel)

def add_verProc(indentlevel=0):
  add_indented_code("/* verProc */", indentlevel)
  add_indented_code("for (int x = 0; x < ADDRSIZE; x++) {", indentlevel)
  add_indented_code("for (int k = 0; k < NCONTEXT-1; k++) {", indentlevel+1)
  add_indented_code("ASSUME(MU(x,k) == MUINIT(x,k+1));", indentlevel+2)
  add_indented_code("ASSUME(NW(x,k) == NWINIT(x,k+1));", indentlevel+2)
  add_indented_code("ASSUME(DELTA(x,k) == DELTAINIT(x,k+1));", indentlevel+2)
  add_indented_code("}", indentlevel+1)
  add_indented_code("}", indentlevel)
  add_indented_code("if (", indentlevel)
  for cnd in final_conds:
    add_indented_code(cnd + " &&", indentlevel+1)
  add_indented_code("1)", indentlevel)
  add_indented_code("ASSERT(0);", indentlevel+1)
  add_indented_code("", indentlevel)
  

  # add_code

def add_aci_instruction(instr, indentlevel=0):
  if (instr.op1 == "BEQ"):
    add_indented_code("/* BEQ */", indentlevel)
    add_control(instr.p, indentlevel)
    # Can commit BEQ only after registers 1 and 0 are ready
    add_indented_code(f"ASSUME(ctrl[{instr.p}] >= CREG({instr.p},0));", indentlevel)
    add_indented_code(f"ASSUME(ctrl[{instr.p}] >= CREG({instr.p},1));", indentlevel)
    add_indented_code(f"if (REGP({instr.p},0) == REGP({instr.p},1))", indentlevel)
    add_indented_code(f"goto {instr.op2};", indentlevel+1)
    add_indented_code("", indentlevel)
  elif (instr.op1 == "BNE"):
    add_indented_code("/* BNE */", indentlevel)
    add_control(instr.p, indentlevel)
    # Can commit BEQ only after registers 1 and 0 are ready
    add_indented_code(f"ASSUME(ctrl[{instr.p}] >= CREG({instr.p},0));", indentlevel)
    add_indented_code(f"ASSUME(ctrl[{instr.p}] >= CREG({instr.p},1));", indentlevel)
    add_indented_code(f"if (REGP({instr.p},0) != REGP({instr.p},1))", indentlevel)
    add_indented_code(f"goto {instr.op2};", indentlevel+1)
    add_indented_code("", indentlevel)
  elif (instr.op1 == "BGE"):
    add_indented_code("/* BGE */", indentlevel)
    add_control(instr.p, indentlevel)
    # Can commit BEQ only after registers 1 and 0 are ready
    add_indented_code(f"ASSUME(ctrl[{instr.p}] >= CREG({instr.p},0));", indentlevel)
    add_indented_code(f"ASSUME(ctrl[{instr.p}] >= CREG({instr.p},1));", indentlevel)
    add_indented_code(f"if (REGP({instr.p},0) >= REGP({instr.p},1))", indentlevel)
    add_indented_code(f"goto {instr.op2};", indentlevel+1)
    add_indented_code("", indentlevel)
  elif (instr.op1 == "BGT"):
    add_indented_code("/* BGT */", indentlevel)
    add_control(instr.p, indentlevel)
    add_indented_code(f"ASSUME(ctrl[{instr.p}] >= CREG({instr.p},0));", indentlevel)
    add_indented_code(f"ASSUME(ctrl[{instr.p}] >= CREG({instr.p},1));", indentlevel)
    add_indented_code(f"if (REGP({instr.p},0) > REGP({instr.p},1))", indentlevel)
    add_indented_code(f"goto {instr.op2};", indentlevel+1)
    add_indented_code("", indentlevel)
  elif (instr.op1 == "CBZ"):
    add_indented_code("/* CBZ */", indentlevel)
    add_control(instr.p, indentlevel)
    add_indented_code(f"ASSUME(ctrl[{instr.p}] >= CREG({instr.p},{instr.op2}));", indentlevel)
    add_indented_code(f"if (REGP({instr.p},{instr.op2}) == 0)", indentlevel)
    add_indented_code(f"goto {instr.op3};", indentlevel+1)
    add_indented_code("", indentlevel)
  elif (instr.op1 == "CBNZ"):
    add_indented_code("/* CBNZ */", indentlevel)
    add_control(instr.p, indentlevel)
    add_indented_code(f"ASSUME(ctrl[{instr.p}] >= CREG({instr.p},{instr.op2}));", indentlevel)
    add_indented_code(f"if (REGP({instr.p},{instr.op2}) != 0)", indentlevel)
    add_indented_code(f"goto {instr.op3};", indentlevel+1)
    add_indented_code("", indentlevel)
  elif (instr.op1 == "B"):
    add_indented_code("/* B */", indentlevel)
    add_control(instr.p, indentlevel)
    add_indented_code(f"goto {instr.op2};", indentlevel)
    add_indented_code("", indentlevel)


def add_instruction(instr, indentlevel=0):
  # labels and goto's not handled yet
  if instr.i_type == InstrType.ACI.value:
    add_aci_instruction(instr, indentlevel)
    return
  if instr.i_type == InstrType.LABEL.value:
    add_indented_code(instr.op1 + ":", 0)
    return
  if instr.i_type == InstrType.LD.value:
    add_LD(instr.p, instr.op1, instr.op2, indentlevel)
  elif instr.i_type == InstrType.LDA.value:
    add_LDA(instr.p, instr.op1, instr.op2, indentlevel)
  elif instr.i_type == InstrType.LDX.value:
    add_LDX(instr.p, instr.op1, instr.op2, indentlevel)
  elif instr.i_type == InstrType.LDAX.value:
    add_LDAX(instr.p, instr.op1, instr.op2, indentlevel)
  elif instr.i_type == InstrType.ST.value:
    add_ST(instr.p, instr.op1, instr.op2, indentlevel)
  elif instr.i_type == InstrType.STL.value:
    add_STL(instr.p, instr.op1, instr.op2, indentlevel)
  elif instr.i_type == InstrType.STX.value:
    add_STX(instr.p, instr.op1, instr.op2, instr.op3, indentlevel)
  elif instr.i_type == InstrType.STLX.value:
    add_STLX(instr.p, instr.op1, instr.op2, instr.op3, indentlevel)
  elif instr.i_type == InstrType.ASSIGN.value:
    add_assign(instr.p, instr.op1, instr.op2, indentlevel)
  elif instr.i_type == InstrType.DMBSY.value:
    add_dmb_sy(instr.p, indentlevel)
  elif instr.i_type == InstrType.ISB.value:
    add_isb(instr.p, indentlevel)
  elif instr.i_type == InstrType.DMBLD.value:
    add_dmb_ld(instr.p, indentlevel)
  elif instr.i_type == InstrType.DMBST.value:
    add_dmb_st(instr.p, indentlevel)

def translate_code(indentlevel=0):
  add_preamble()
  # add_indented_code("int main(int argc, char **argv)", indentlevel)
  # add_indented_code("{", indentlevel)
  # add_initProc(indentlevel+1)
  indentlevel = 0;
  for p in range(nproc):
    add_indented_code(f"int thread{p}()"+"{", indentlevel)
    add_indented_code(f"// Process {p} BEGIN", indentlevel+1)
    for i in range(0,nregs):
      add_indented_code(f"int r{i}=0;", indentlevel+1)
    for r in init_reg[p]:
      val= init_reg[p][r]
      add_indented_code(f"r{r}=" + val + ";", indentlevel+1)        
    for instr in incode[p]:
      add_instruction(instr, indentlevel+1)
    add_indented_code(f"// Process {p} END", indentlevel+1)
    add_indented_code("", indentlevel+1)
    add_indented_code("}", indentlevel)
  add_spec(indentlevel);
  # add_verProc(indentlevel+1);
  # add_indented_code("return 0;", indentlevel+1)


def write_translated_code():
  ### Write the code to the output file ###
  print('Dumping:'+outfile)
  with open(outfile,'w+') as file:
    file.write('\n'.join(str(line) for line in code))

#-----------------------------------------------------------------------
# main

parse_from_litmus(infile)
print_program()
# exit()
translate_code()
write_translated_code()



'''
for proc in range(nproc):
  print(f"=========== {proc} ===========")
  for instr in incode[proc]:
    print(f"{instr.i_type} {instr.op1} {instr.op2} {instr.op3}")
'''
