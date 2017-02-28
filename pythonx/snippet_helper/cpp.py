import os

def split_namespaces_by_pathsep(path):
    dirname = os.path.dirname(path)
    curpath = os.path.normpath(dirname)
    return curpath.split(os.sep)

def split_namespaces_by_colon(fullname):
    if fullname == '::':
        return fullname.split('::')[1:]
    return fullname.split('::')

def normalize_namespace(name):
    return ' ' + name if name else ''

def write_namespaces_begin(snip, namespaces):
    for name in namespaces:
        snip.rv += "namespace{} {{\n".format(normalize_namespace(name))

def write_namespaces_end(snip, namespaces):
    for name in reversed(namespaces):
        snip += "}} /* namespace{} */".format(normalize_namespace(name))
