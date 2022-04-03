# Cython 

## Compile Cython/Python code
The pipeline consist of two stages:
* The `cython` compiler, compiles any `C/Python` code to `C/C++`, 
   platform **independent**

* The second stage compiles the generated C or C++ source into a shared library with
  a standard C or C++ compiler. The result shared library is platform **dependent**.
  `.so` or `pyd` for windows. The flags passed to the C or the C++ compiler ensures this
  shared library a full `Python module`

#### Using distutils.

```python
from setuptools import setup
from Cython.Build import cythonize

setup(
    name='Hello world app',
    ext_modules=cythonize("hello.pyx"),
    zip_safe=False,
)

```
Build the python module using.
`python setup.py build_ext --inplace`

```jupyter
import hello
hello?
Type:        module
String form: <module 'hello' from '/home/ioannis/projects/myCython/hello_world/hello.cpython-38-x86_64-linux-gnu.so'>
File:        ~/projects/myCython/hello_world/hello.cpython-38-x86_64-linux-gnu.so
Docstring:   Pure Cython script for hello world

```

#### Using iPython.

```jupyterpython
%load_ext Cython
%%cython 
def fib(int n):
    cdef int i 
    cdef double a=0.0 b=1.0
    for i in range(n):
        a, b = a+b , a
    return a
```

#### Cython Standalone executables
* `cython some_script.py`
* `gcc $(python-config --cflags) $(python-config --ldflags) ./some_script.c`
