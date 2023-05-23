import sys


class Node():
    def children(self):
        pass

    def show(self, buf=sys.stdout, offset=0, nodenames=False, _my_node_name=None):
        """ Pretty print the Node and all its attributes and
            children (recursively) to a buffer.

            buf:
                Open IO buffer into which the Node is printed.

            offset:
                Initial offset (amount of leading spaces)

            attrnames:
                True if you want to see the attribute names in
                name=value pairs. False to only see the values.

            nodenames:
                True if you want to see the actual node names
                within their parents.

        """
        lead = ' ' * offset
        if nodenames and _my_node_name is not None:
            buf.write(lead + self.__class__.__name__+ ' <' + _my_node_name + '>: ')
        else:
            buf.write(lead + self.__class__.__name__+ ': ')

        buf.write('\n')

        for (child_name, child) in self.children():
            if child is not None:
                if hasattr(child, 'show'):
                    child.show(buf, offset=offset + 2, nodenames=nodenames, _my_node_name=child_name)
                else:
                    buf.write(lead + 2*' ' + str(child) + '\n')

class File(Node):
    def __init__(self, valueEstimateList):
        self.valueEstimateList = valueEstimateList

    def children(self):
        nodelist = []
        for i, child in enumerate(self.valueEstimateList or []):
            nodelist.append(("valueEstimateList[%s]" % i, child))
        return tuple(nodelist)

class ValueEstimate(Node):
    def __init__(self, variable, value):
        self.variable = variable
        self.value = value

    def children(self):
        nodelist = []
        nodelist.append(("variable", self.variable))
        nodelist.append(("value", self.value))
        return tuple(nodelist)


class ScalarVariable(Node):
    def __init__(self, name):
        self.name = name

    def children(self):
        nodelist = []
        nodelist.append(("name", self.name))
        return tuple(nodelist)


class ArrayVariable(Node):
    def __init__(self, variable, numberRange):
        self.variable = variable
        self.numberRange = numberRange

    def children(self):
        nodelist = []
        nodelist.append(("variable", self.variable))
        nodelist.append(("numberRange", self.numberRange))
        return tuple(nodelist)


class StructVariable(Node):
    def __init__(self, variable, fields):
        self.variable = variable
        self.fields = fields

    def children(self):
        nodelist = []
        nodelist.append(("variable", self.variable))
        for i, child in enumerate(self.fields or []):
            nodelist.append(("fields[%s]" % i, child))
        return tuple(nodelist)


class Field(Node):
    def __init__(self, variable):
        self.variable = variable

    def children(self):
        nodelist = []
        nodelist.append(("variable", self.variable))
        return tuple(nodelist)


class AddressField(Node):
    def __init__(self, index, variable=None):
        self.index = index
        self.variable = variable

    def children(self):
        nodelist = []
        nodelist.append(("index", self.index))
        nodelist.append(("variable", self.variable))
        return tuple(nodelist)


class ValueSet(Node):
    def __init__(self, numberList):
        self.numberList = numberList

    def children(self):
        nodelist = []
        for i, child in enumerate(self.numberList or []):
            nodelist.append(("numberList[%s]" % i, child))
        return tuple(nodelist)


class ValueRange(Node):
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def children(self):
        nodelist = []
        nodelist.append(("left", self.left))
        nodelist.append(("right", self.right))
        return tuple(nodelist)

class ValueRangePeriodicity(Node):
    def __init__(self, left, right, remainder, divisor):
        self.left = left
        self.right = right
        self.remainder = remainder
        self.divisor = divisor

    def children(self):
        nodelist = []
        nodelist.append(("left", self.left))
        nodelist.append(("right", self.right))
        nodelist.append(("remainder", self.remainder))
        nodelist.append(("divisor", self.divisor))
        return tuple(nodelist)


class ValueMemSet(Node):
    def __init__(self, memExpressionList):
        self.memExpressionList = memExpressionList

    def children(self):
        nodelist = []
        for i, child in enumerate(self.memExpressionList or []):
            nodelist.append(("memExpressionList[%s]" % i, child))
        return tuple(nodelist)


class AddressScalarVariable(Node):
    def __init__(self, variable):
        self.variable = variable

    def children(self):
        nodelist = []
        nodelist.append(("variable", self.variable))
        return tuple(nodelist)

class AddressCompoundVariable(Node):
    def __init__(self, variable, fields):
        self.variable = variable
        self.fields = fields

    def children(self):
        nodelist = []
        nodelist.append(("variable", self.variable))
        for i, child in enumerate(self.fields or []):
            nodelist.append(("fields[%s]" % i, child))
        return tuple(nodelist)


class ValueRangeExpression(Node):
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def children(self):
        nodelist = []
        nodelist.append(("left", self.left))
        nodelist.append(("right", self.right))
        return tuple(nodelist)


class NullExpression(Node):
    def children(self):
        return tuple([])


class ComboExpression(Node):
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def children(self):
        nodelist = []
        nodelist.append(("left", self.left))
        nodelist.append(("right", self.right))
        return tuple(nodelist)


class SingleRange(Node):
    def __init__(self, index):
        self.index = index

    def children(self):
        nodelist = []
        nodelist.append(("index", self.index))
        return tuple(nodelist)


class DoubleRange(Node):
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def children(self):
        nodelist = []
        nodelist.append(("left", self.left))
        nodelist.append(("right", self.right))
        return tuple(nodelist)


# class DecNumber(Node):
#     def __init__(self, value):
#         self.value = value

#     def children(self):
#         nodelist = []
#         nodelist.append(("value", self.value))
#         return tuple(nodelist)


# class HexNumber(Node):
#     def __init__(self, value):
#         self.value = value

#     def children(self):
#         nodelist = []
#         nodelist.append(("value", self.value))
#         return tuple(nodelist)


# class Float(Node):
#     def __init__(self, value):
#         self.value = value

#     def children(self):
#         nodelist = []
#         nodelist.append(("value", self.value))
#         return tuple(nodelist)


class Infinity(Node):
    def __init__(self):
        self.value = ''

    def children(self):
        return tuple([])
