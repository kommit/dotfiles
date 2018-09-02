#!/usr/bin/env python3

import os
import shutil
from glob import glob

ignore_files = {
    '.',
    '..',
    '.git',
    '.gitignore',
}

home = os.path.expanduser('~')
dotfiles = os.path.dirname(__file__)
os.chdir(dotfiles or '.')

for fn in glob('.*'):
    if fn in ignore_files:
        continue
    src_file = os.path.realpath(fn)
    dst_file = os.path.join(home, fn)
    print('Creating symlink of "%s" to "%s" ... ' % (src_file, dst_file))
    if os.path.exists(dst_file):
        print('destination exists, skip.')
    else:
        os.symlink(src_file, dst_file)
        print('done')
