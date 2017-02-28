import re

def strip_path(snip, path):
    strip_strings = snip.opt('g:snips_c_once_base_path', '')
    if (strip_strings):
        return re.sub(r'^' + strip_strings, '', path)
    return path

def get_define_guard(snip, path):
    import string
    if not snip.c:
        name = re.sub(r'[^A-Za-z0-9]+','_', path).upper()
        return ('%s_' % (name)).upper()
    else:
        return snip.c
