#!/usr/bin/python3

# Copyright (C) 2023 Tuan Phong Ngo
# Genereate example.py for Ashutosh to test ARMCBMC 

import os

current_file_path = os.path.abspath(__file__)
current_folder_path = os.path.dirname(current_file_path)
EXPECTED_LIST_FILE = current_folder_path + '/../exclusive.aarch64.herd.results.txt'
ARMCBMC_LITMUS_FOLDER = current_folder_path + '/../c-litmus-ARMCBMC'
EXAMPLE_FILE = ARMCBMC_LITMUS_FOLDER + '/example.py'
PTHREAD_CREATE_STRING = 'pthread_create'
CONTEXT_NUM = 10
UNROLL_NUM = 1
ERROR_CODE = -1
DEBUG_ENABLE = True
PYTHON_IDENTATION = '    '

def get_expected(fname):
    f = open(fname, 'r')
    l = []
    for ln in f:
        ln = ln.strip()
        if len(ln) and not (ln[0] == '#'):
            # print(ln)
            if len(ln.split()) == 2:  # remove FAILURE cases
                [tst, exp] = ln.split()
                assert (exp == 'Allow' or exp == 'Forbid')
                l.append({'tstname': tst, 'expect allow': (exp == 'Allow')})
    f.close()
    return l

def convert_expected_decision(allow_or_forbidden):
    return "unsafe" if allow_or_forbidden else "safe"

def count_string_occurrences_in_file(file_path, search_string):
    if os.path.isfile(file_path):
        with open(file_path, 'r') as file:
            content = file.read()
            occurrences = content.count(search_string)
            return occurrences
    else:
        return str(ERROR_CODE)
    
def generate_file_info(folder_path, file_name, allow_or_forbidden):
    file_path = os.path.join(folder_path, file_name + '.c')
    if os.path.isfile(file_path):
        with open(file_path, 'r') as file:
            content = file.read()
            thread_num = content.count(PTHREAD_CREATE_STRING)
            expected_decision = convert_expected_decision(allow_or_forbidden)
            # E.g., ['ATOM00', '-', 2, 10, 1, 'safe']
            info = "['" + file_name + "', '-', " + str(thread_num) + ", " \
                + str(CONTEXT_NUM) + ", " + str(UNROLL_NUM) + ", '" \
                + expected_decision + "']"
            return info
    else:
        return str(ERROR_CODE)

def generate_file():
    tests = get_expected(EXPECTED_LIST_FILE)
    file_info_list = ['exs=[\n']
    file_info_list.append(PYTHON_IDENTATION +\
                          "# [ FileName, '-', NumberOFThread, Context, Unroll, ExpectedDecision],\n")
    for tst in tests:
        file_name = tst['tstname']
        expected_decision = tst['expect allow']
        file_info = generate_file_info(ARMCBMC_LITMUS_FOLDER, file_name, expected_decision)
        #if DEBUG_ENABLE:
        #    print(file_info)
        file_info_list.append(PYTHON_IDENTATION + file_info + ",\n")
    file_info_list.append(']')
    concatenated_string = ''.join(file_info_list)
    if DEBUG_ENABLE:
        print(concatenated_string)

    with open(EXAMPLE_FILE, "w") as file:
        file.write(concatenated_string)

generate_file()