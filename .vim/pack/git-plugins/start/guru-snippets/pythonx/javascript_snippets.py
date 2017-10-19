import os
import vim
from os import  path
from common_func import *

dictPropTypes = {
        'a' : 'array',
        'b': 'bool',
        'f': 'func',
        'n': 'number',
        'o': 'object',
        's': 'string',
        'no': 'node',
        'nd' : 'node',
        'e': 'element',
        'io': 'instanceOf',
        '1o': 'oneOf',
        '1ot': 'oneOfType',
        'ao': 'arrayOf',
        'oo': 'objectOf',
        'sh': 'shape',
        }


def getTagsFile():
    wd = getWorkingDirectory()
    if path.exists(wd + '/tags'):
        return wd + '/tags'
    if path.exists(wd + '/src/tags'):
        return wd + '/src/tags'
    srcdirec = wd[:wd.rfind("src/")+3]
    if path.exists(srcdirec + '/tags'):
        return srcdirec + '/tags'
    return ""

def getRelevantModuleFromTags(nameComponent):
    if nameComponent == "":
        return ""
    tag_file = getTagsFile()
    if tag_file == "" :
        return ""
    with open(tag_file) as f:
        for line in f:
            if line.startswith(nameComponent):
                filenamepath=line.split('\t')[1]
                result=os.path.relpath(filenamepath, getWorkingDirectory())
                result=result if result.startswith('.') else "./" + result
                result=result.replace('.js','')
                result = result[:-6] if result.endswith('/index') else result
                return result
        return ""

def getSrcDirec():
    wd = getWorkingDirectory()
    if(wd.endswith('src')):
        return wd
    if path.exists(wd + '/src'):
        return wd + '/src'
    srcdirec = wd[:wd.rfind("src/")+3]
    return srcdirec

def getRelevantModule(nameComponent):
    if nameComponent == "":
        return ""
    proc =os.popen('ag -l --js' + ' ^export[^=]*'+nameComponent +'[^=]* ' + getSrcDirec());
    res = proc.read()
    proc.close()
    res = res.split('\n')[0];
    if res == "":
        return ""
    cmnpathprfx=os.path.commonprefix([res,getWorkingDirectory()]);
    return os.path.relpath(res,cmnpathprfx).replace('.js','')


