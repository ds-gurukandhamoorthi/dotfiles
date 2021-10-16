import re
from itertools import count
from common_func import *
from fuzzywuzzy import process
from rustsnippetsutils import gen_init, get_last_read_argument, get_recent_line_containing_pattern

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
    # 'math import cos',
    'numpy.random import choice',
    'collections import Counter',
    'collections import defaultdict',
    'sklearn.linear_model import LinearRegression',
    'sklearn.linear_model import LogisticRegression',
    'sklearn.pipeline import make_pipeline',
    'sklearn.model_selection import train_test_split',
    'sklearn.metrics import confusion_matrix',
    'sklearn.manifold import Isomap',
    'sklearn.model_selection import GridSearchCV',
    'sklearn.model_selection import cross_val_score',
    'sklearn.decomposition import PCA',
    'sklearn.svm import SVC',
    'sklearn.naive_bayes import GaussianNB',
    'sklearn.neighbors import KNeighborsClassifier',
    'sklearn.feature_extraction.text import TfidfVectorizer',
    'sklearn.preprocessing import PolynomialFeatures',
    'sklearn.datasets import load_iris',
    'sklearn.datasets import make_blobs',
    'sklearn.datasets import load_digits',
    'sklearn.ensemble import RandomForestClassifier',
    'sklearn.metrics import accuracy_score',
    'sklearn.linear_model import Ridge',
    'sklearn.cluster import KMeans',
    'sklearn.tree import DecisionTreeRegressor',
    'sklearn.tree import DecisionTreeClassifier',
    'mpl_toolkits.basemap import Basemap',
    'tensorflow import keras',

    'bs4 import BeautifulSoup',
]


def getImports(mnemo):
    lib = process.extractOne(mnemo, IMPORTS)[0]
    return 'import ' + lib


def getStaticImports(mnemo):
    lib = process.extractOne(mnemo, STATIC_IMPORTS)[0]
    return 'from ' + lib


def forLoop(variable, start, end):
    templ = 'for ' + variable + ' in range(%s):'
    if start == '0':
        return templ % end
    if end == "":
        return templ % start
    if start == "":
        return templ % end


def getLastReadArgument_deprecated(line):
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


#Deprectated in favor of rust powered code
def gen_init_deprecated(variables_str):
    variables = variables_str.split(',')
    TAB = '    '
    templ = lambda var: (TAB + 'self._%s = %s\n' + TAB) % (var, var)
    return ''.join(templ(v.strip()) for v in variables)
