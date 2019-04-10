import os
import glob
from funcy import cut_prefix

def remove_common_prefix(strs):
    cmn_pref = os.path.commonprefix(strs)
    return [cut_prefix(s, cmn_pref) for s in strs]

def remove_common_suffix(strs):
    rev = lambda s:s[::-1]
    rev_all = lambda strs: list(map(rev, strs))
    reversed_strs = rev_all(strs)
    return rev_all(remove_common_prefix(reversed_strs))

remove_adfix = lambda s: remove_common_prefix(remove_common_suffix(s))


if __name__ == "__main__":
    lst = ['abc', 'abe',  'abf']
    print(remove_common_prefix(lst))
    lst = ['abcdef', 'abedef',  'abfdef']
    print(remove_common_suffix(lst))
    lst = glob.glob('*')
    print(remove_common_suffix(remove_common_prefix(lst)))
    print(remove_adfix(lst))
