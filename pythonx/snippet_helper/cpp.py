import os

def get_namespaces(path):
    dirname = os.path.dirname(path)
    curpath = os.path.normpath(dirname)
    for name in curpath.split(os.sep):
        yield name

def write_namespaces(snip, path):
    pass
