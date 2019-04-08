import re
from itertools import count
from common_func import *
from fuzzywuzzy import process

# Use gf on the following line to switch to the python script file
# ../UltiSnips/python.snippets

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
    'statsmodels.api as sm',
    'statsmodels.formula.api as smf',
    'zipline as zp',
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
    templ = 'for ' + variable + ' in range(%s)'
    if start == '0':
        return templ % end
    if end == "":
        return templ % start
    if start == "":
        return templ % end


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
    ind = count()
    return [[next(ind) for j in range(c)] for i in range(l)]


def iota(variable):
    return 'range(%s+1)' % variable


def gen_range(variable):
    return 'range(%s)' % variable


def gen_init(variables_str):
    variables = variables_str.split(',')
    TAB = '    '
    templ = lambda var: (TAB + 'self._%s = %s\n' + TAB) % (var, var)
    return ''.join(templ(v.strip()) for v in variables)
