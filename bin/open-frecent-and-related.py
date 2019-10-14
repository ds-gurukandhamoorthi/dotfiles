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
    group = parser.add_mutually_exclusive_group()
    group.add_argument('--file-exts', type=str, nargs='+', help='file extension')
    group.add_argument('--file-type-book', action='store_true', help='books: epub, pdf, mobi...')
    group.add_argument('--file-type-audio', action='store_true', help='audio files: mp3, wav, m4a, aac, opus, webm...')
    group.add_argument('--file-type-video', action='store_true', help='video files: mp4, mkv, avi, wav, mpg, webm...')
    group.add_argument('--file-type-image', action='store_true', help='image files: jpg, png, gif, ...')
    group.add_argument('--file-type-code', action='store_true', help='code files: R, py')
    args = parser.parse_args()
    if args.file_type_book:
        file_exts = ['pdf', 'epub', 'mobi']
    elif args.file_type_audio:
        file_exts = ['mp3', 'wav', 'm4a', 'aac', 'opus', 'webm']
    elif args.file_type_video:
        file_exts = ['mp4', 'mk4', 'avi', 'wav', 'mpg', 'webm']
    elif args.file_type_image:
        file_exts = ['png', 'jpg', 'gif']
    elif args.file_type_code:
        file_exts = ['R', 'py']
    else:
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

