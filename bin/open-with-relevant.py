import os
import glob
from funcy import cut_prefix
from operator import __and__
from functools import reduce

def remove_common_prefix(strs):
    cmn_pref = os.path.commonprefix(strs)
    return [cut_prefix(s, cmn_pref) for s in strs]

def remove_common_suffix(strs):
    rev = lambda s:s[::-1]
    rev_all = lambda strs: list(map(rev, strs))
    reversed_strs = rev_all(strs)
    return rev_all(remove_common_prefix(reversed_strs))

remove_adfix = lambda s: remove_common_prefix(remove_common_suffix(s))

# Normally it is but longest common substring. but there may be multiple in some cases
def longest_common_substrings(strs):
    for i in range(len(strs[0]), 0, -1):
        res = common_stem_of_length(strs, i)
        if res:
            return list(res)
    return None


def common_stem_of_length(strs, n):
    arr = [set(stems_of_length(s, n)) for s in strs]
    res = reduce(__and__, arr)
    if len(res) > 0:
        return res
    return None


def stems_of_length(string, n):
    return (string[i:i+n] for i in range(0, len(string)-n+1))


       


if __name__ == "__main__":
    lst = ['abc', 'abe',  'abf']
    print(remove_common_prefix(lst))
    lst = ['abcdef', 'abedef',  'abfdef']
    print(remove_common_suffix(lst))
    lst = glob.glob('*')
    print(remove_common_suffix(remove_common_prefix(lst)))
    print(remove_adfix(lst))
    print(longest_common_substrings(lst))

