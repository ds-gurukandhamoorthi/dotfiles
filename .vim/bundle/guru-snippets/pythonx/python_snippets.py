def getImports(mnemo):
    if(mnemo == "r"):
        return 'import random'
    if(mnemo == "s"):
        return 'import sys'
    if(mnemo == "m"):
        return 'import math'
    if(mnemo == "ap"):
        return 'import argparse'
    if(mnemo == "mp"):
        return 'import matplotlib.pyplot as plt'
    return 'import'

def forLoop(variable, start, end):
    res = 'for ' + variable + ' in range('
    if(start == '0'):
        return res + end + '):'
    if(end == ""):
        return res + start + '):'
    if(start == ""):
        return res + end + '):'

def getPreviousLine():
    # line = vim.current.window.cursor[0] #<-this causes error ... cyclic error
        line = snip.snippet_start[0]
        if line >= 1 :
            return vim.current.window.buffer[line-1]
        return "" 

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
