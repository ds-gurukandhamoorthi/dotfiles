import vim 

def getWorkingDirectory():
    return vim.eval('expand("%:p:h")')

def getPreviousLine(snip):
    # line = vim.current.window.cursor[0] #<-this causes error ... cyclic error
        line = snip.snippet_start[0]
        if line >= 1 :
            return vim.current.window.buffer[line-1]
        return "" 

def getSingleWord(nameComponent):
    return nameComponent.split(',')[0].replace('{','').replace('}','')

def upperCaseUnderscore(text):
    return text.upper().replace(' ','_')
