#Not only does it open frecent files but also the files from the directories containing it.

import os
import sys
import subprocess
import glob
import dmenu
from funcy import re_test, filter, group_by
from os.path import splitext


def get_extension(f):
    return splitext(f)[1]

# NOTE: It would be much better to create a dictionary of extensions {'.pdf': [], '.epub': []}


def main():
    extension = sys.argv[1]
    cmd = subprocess.Popen(['fasd', '-f', '-R', '-l'], stdout=subprocess.PIPE)
    sout, serr = cmd.communicate()
    sout = sout.decode('utf-8')
    all_files = sout.split('\n')
    files_gr_extension = group_by(get_extension, all_files)
    files = files_gr_extension['.'+ extension] #files of given extension: pdfs ...
    dir_files = list(
            group_by(os.path.dirname, files).keys())
    for dir in dir_files:
        files += glob.glob(dir + '/' + '*.' + extension)
    res = dmenu.show(files, case_insensitive=True, lines=3)
    print(res)

if __name__ == "__main__":
    main()

