def get_args(arglist):
    return [arg.strip() for arg in arglist.split(',') if arg.strip()]

def write_fields(args, snip):
    for arg in args:
        snip += "self.%s = %s" % (arg, arg)

def write_init_body(args, class_name, snip):
    snip += "super(" + class_name + ", self).__init__()"
    snip += ""
    write_fields(args, snip)
