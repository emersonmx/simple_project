import re

__all__ = ["get_args_php"]

def get_args_php(group):
    word = re.compile('\$\w+')
    return [i for i in word.findall(group)]
