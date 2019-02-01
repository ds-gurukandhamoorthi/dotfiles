import re
from itertools import count
from common_func import *
from fuzzywuzzy import process

# Use gf on the following line to switch to the snippets file
# ../UltiSnips/r.snippets

LIBRARIES = [
    'tidyverse',
    'yaml',
    'quantmod',
    'beanplot',
    'TTR',
    'lubridate',
    'vioplot',
    'tibbletime',
    'purrr',
    'magrittr',
    'wordcloud',
    'entropy',
    'tidyquant',
    'readr',
    'moments',
    'dplyr',
    'forcats',
    'corrplot',
    'feather',
    'candlesticks',
    'digest',
    'modelr',
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

def previous_line_forces_tabulation_on_me(snip):    
    line = getPreviousLine(snip)
    if re.match('\s', line): #starts with whitespace meaning : it already has tabulation : so no need for additional tabulations
        return False
    if '=' in line: # contains = means  probably inside a parenthesis
        return False
    return is_there_a_pipe_in_previous_line(snip)
