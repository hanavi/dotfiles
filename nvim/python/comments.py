#!/usr/bin/env python
# coding: utf-8
# Author: James Casey <hanavi@gmail.com>
# Last Updated: 2024-10-09

import re
from datetime import datetime

# print('loading python scripts')

def update_header_date():
    """Example for updating a date in the header."""
    now = datetime.now()
    b = vim.current.buffer
    for i in range(5):
        b[i] = b[i].replace("__DATE__", now.strftime("%Y-%m-%d"))


def build_docstring():
    """Build a docstring for a python function...

    TODO: this could be cleaned up a ton...
    """

    b = vim.current.buffer
    start = vim.current.range.start
    end = vim.current.range.end + 1
    lines = b[start:end]
    count = len(re.sub(r"^( *)[^ ].*", r"\1", lines[0]))
    blob = " ".join(lines)
    args = re.sub(r'.*\((.*)\).*', r"\1", blob)
    spacing = ' ' * count + '    '

    comments = ['"""<++>', '', 'Arguments', '---------']

    for arg in args.split(','):
        arg = arg.strip()
        if arg == 'self':
            continue
        arg = arg.split(":")[0]
        argline = '    ' + arg + ": <++>"
        comments.append(argline)

    comments += ['', 'Returns', '-------', "    <++>", '"""']

    # pad everything with initial spacing
    comments = [spacing + l for l in comments]

    b.append(comments, end)


