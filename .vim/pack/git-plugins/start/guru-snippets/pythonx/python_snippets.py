import re
from itertools import product, count
from common_func import *
from fuzzywuzzy import process

IMPORTS = [
    'sys',
    'math',
    'random',
    'argparse',
    'datetime',
    'matplotlib.pyplot as plt',
    'matplotlib.patches as patches',
    'matplotlib.collections',
    'matplotlib.image as mpimg',
    'functools',
    'itertools',
    'numpy as np',
    'pandas as pd',
    'subprocess',
    'requests',
    'seaborn as sns',
    'statsmodels as sm',
]

STATIC_IMPORTS = [
    'math import cos',
    'numpy.random import choice',
    'collections import Counter',
    'collections import defaultdict',
    'bs4 import BeautifulSoup',
]


def getImports(mnemo):
    lib = process.extractOne(mnemo, IMPORTS)[0]
    return 'import ' + lib


def getStaticImports(mnemo):
    lib = process.extractOne(mnemo, STATIC_IMPORTS)[0]
    return 'from ' + lib


def forLoop(variable, start, end):
    res = 'for ' + variable + ' in range('
    if start == '0':
        return res + end + '):'
    if end == "":
        return res + start + '):'
    if start == "":
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
    if len(sides) > 1:
        return sides[0].strip()
    return ''


def getVariable(line):
    return getLHS(line)


def getIntegerMatrix(l, c):
    res = [[0] * c for i in range(l)]
    for (i, j), ind in zip(product(range(l), range(c)), count()):
        res[i][j] = ind
    return res


def iota(variable):
    return 'range(%s+1)' % variable


def gen_range(variable):
    return 'range(%s)' % variable


def gen_init(variables_str):
    variables = variables_str.split(',')
    TAB = '    '
    templ = lambda var: (TAB + 'self._%s = %s\n' + TAB) % (var, var)
    return ''.join(templ(v.strip()) for v in variables)
