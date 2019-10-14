#Not only does it open frecent files but also the files from the directories containing it.

import os
import sys
import subprocess
import argparse
import glob
import dmenu
from funcy import re_test, filter, group_by
from os.path import splitext


def get_extension(f):
    return splitext(f)[1]

# NOTE: It would be much better to create a dictionary of extensions {'.pdf': [], '.epub': []}
# NOTE: May be not. if we want ordered by frecency it may not be a good idea

def files_of_extensions(files, exts):
    files_gr_extension = group_by(get_extension, files)
    res = []
    for ext in exts:
        res += files_gr_extension['.' + ext]
    return res




def main():
    parser = argparse.ArgumentParser(description='Open frecent and related files')
    parser.add_argument('--file-exts', type=str, nargs='+', help='file extension')
    args = parser.parse_args()
    file_exts = args.file_exts
    cmd = subprocess.Popen(['fasd', '-f', '-R', '-l'], stdout=subprocess.PIPE)
    sout, serr = cmd.communicate()
    sout = sout.decode('utf-8')
    all_files = sout.split('\n')
    # files = files_gr_extension['.'+ file_exts] #files of given extension: pdfs ...
    files = files_of_extensions(all_files, file_exts) #file_exts is an array
    dir_files = list(
            group_by(os.path.dirname, files).keys())
    for dir in dir_files:
        for ext in file_exts:
            files += glob.glob(dir + '/' + '*.' + ext)
    res = dmenu.show(files, case_insensitive=True, lines=3)
    print(res)

if __name__ == "__main__":
    main()

