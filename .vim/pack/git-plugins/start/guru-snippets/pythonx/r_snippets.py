import re
from itertools import count
from common_func import *
from fuzzywuzzy import process

# Use gf on the following line to switch to the snippets file
# ../UltiSnips/r.snippets

LIBRARIES = [
    'tidyverse',
    'quantmod',
    'wordcloud',
    'corrplot',
    'feather',
    'beanplot',
    'candlesticks',
    'digest',
    'entropy',
]

def getLibraries(mnemo):
    lib = process.extractOne(mnemo, LIBRARIES)[0]
    return 'library(%s)' % lib

def is_there_a_pipe_in_previous_line(snip):
    line = getPreviousLine(snip)
    return "%>%" in line

def previous_lines_starts_with_tab(snip):
    line = getPreviousLine(snip)
    return(line.startswith('\t'))

    
