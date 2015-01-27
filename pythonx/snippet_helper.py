import re

def get_args_php(group):
    word = re.compile('\$\w+')
    return [i for i in word.findall(group)]

def write_construct_php(args, snip):
    for arg in args:
        snip += "private {};".format(arg)
    snip += "public functions __construct() {"
    snip >> 2
    for arg in args:
        snip += "$this->{} = {};".format(arg[1:], arg)
    snip << 1
    snip += "}"

def write_get_set_php(args, snip):
    for arg in args:
        snip += "public function get{}() {{".format(arg[1:].title())
        snip >> 1
        snip += "return $this->{};".format(arg[1:])
        snip << 1
        snip += "}\n"

        snip += "public function set{}({}) {{".format(arg[1:].title(), arg)
        snip >> 1
        snip += "$this->{} = {};".format(arg[1:], arg)
        snip << 1
        snip += "}\n"
    snip << 1
