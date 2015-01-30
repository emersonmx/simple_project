import re

def write_args(args):
    return ", ".join(map(str, args))

def first_upper(field):
    if field:
        return field[0].upper() + field[1:]
    return field

def first_lower(field):
    if field:
        return field[0].lower() + field[1:]
    return field

def get_args(group):
    word = re.compile('\$\w+')
    return [i for i in word.findall(group)]

def write_fields(args, snip):
    snip >> 1
    for arg in args:
        snip += "private {};".format(arg)

def write_construct_body(args, snip):
    snip >> 2
    for arg in args:
        snip += "$this->{} = {};".format(arg[1:], arg)
    snip << 1

def write_getter(field, snip):
    snip += "public function get{}() {{".format(first_upper(field[1:]))
    snip >> 1
    snip += "return $this->{};".format(field[1:])
    snip << 1
    snip += "}\n"

def write_setter(field, snip):
    snip += "public function set{}({}) {{".format(
            first_upper(field[1:]), field)
    snip >> 1
    snip += "$this->{} = {};".format(field[1:], field)
    snip << 1
    snip += "}\n"

def write_getter_setter(args, snip):
    snip >> 1
    for arg in args:
        write_getter(arg, snip)
        write_setter(arg, snip)
    snip << 1
