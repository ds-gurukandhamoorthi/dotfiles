from common_func import *
import re
from fuzzywuzzy import fuzz, process

IMPORTS= [
        'sys',
        'math',
        'random',
        'argparse',
        'matplotlib.pyplot as plt',
        'matplotlib.patches as patches',
        'matplotlib.collections',
        'functools',
        'itertools',
        'numpy as np',
        'subprocess',
        ]

STATIC_IMPORTS= [
        'math import cos',
        'numpy.random import choice',
        'collections import Counter',
        ]

def getImports(mnemo):
    lib = process.extractOne(mnemo, IMPORTS)[0]
    return 'import ' + lib

def getStaticImports(mnemo):
    lib = process.extractOne(mnemo, STATIC_IMPORTS)[0]
    return 'from ' + lib

def forLoop(variable, start, end):
    res = 'for ' + variable + ' in range('
    if(start == '0'):
        return res + end + '):'
    if(end == ""):
        return res + start + '):'
    if(start == ""):
        return res + end + '):'

def getLastReadArgument(line):
    regexp = r'argv\[(\d+)\]'
    srchRes = re.search(regexp, line)
    if srchRes:
        num = srchRes.group(1)
        return int(num) + 1
    return 1

def getLHS(expression):
    sides = expression.split('=') 
    if(len(sides)>1):
        return sides[0].strip()
    return ''

def getVariable(line):
    return getLHS(line)

def getIntegerMatrix(l,c):
    res=[[0]*c for i in range(l)]
    count = 0
    for i in range(l):
        for j in range(c):
            res[i][j] = count
            count += 1
    return res

def iota(variable):
    res = 'range(1,'
    res += variable + '+1'
    return res + ')'

