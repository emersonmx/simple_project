import string
import re

VIM_KEY_ONCE = 'g:snips_c_strip_paths'

def strip_path(path, strip_paths):
    for str in strip_paths:
        if path.startswith(str):
            return re.sub(r'^' + str, '', path)
    return path

def get_define_guard(snip, path):
    if not snip.c:
        name = re.sub(r'[^A-Za-z0-9]+', '_', path).upper()
        return ('%s_' % (name)).upper()

    return snip.c
