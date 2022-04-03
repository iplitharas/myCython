"""Pure Cython script for hello world"""


def greet(name: str):
    """Says hello pure python function"""
    print("Hello %s!" % name)




def greet_cython(str name):
    """Says hello cython function"""
    print("Hello %s!" % name)
    print("Cython code can call pure cdef functions")
    greet_c(name)


cdef greet_c(str name):
    """Says hello cython function can't be used from python code"""
    print("Hello from:greet_c %s!" % name)
