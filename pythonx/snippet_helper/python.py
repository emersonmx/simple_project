def get_args(arglist):
    return [arg.strip() for arg in arglist.split(',') if arg.strip()]

def write_supers(args, parents, snip):
    for p in parents:
        snip += "super(" + p + ", self).__init__()"

def write_fields(args, snip):
    for arg in args:
        snip += "self.%s = %s" % (arg, arg)

def write_init_body(args, parents, snip):
    parents = [p for p in parents if p and p != "object"]
    write_supers(args, parents, snip)
    if parents:
        snip += ""
    write_fields(args, snip)
