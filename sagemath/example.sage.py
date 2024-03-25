

# This file was *autogenerated* from the file example.sage
from sage.all_cmdline import *   # import sage library

_sage_const_8 = Integer(8); _sage_const_3 = Integer(3); _sage_const_1 = Integer(1); _sage_const_2 = Integer(2); _sage_const_4 = Integer(4); _sage_const_0 = Integer(0)# Sample SageMath Script: example.sage

# Arithmetic operations
a = _sage_const_8 
b = _sage_const_3 
print(f"{a} + {b} = {a + b}")
print(f"{a} - {b} = {a - b}")
print(f"{a} * {b} = {a * b}")
print(f"{a} / {b} = {a / b}")

# Matrix operations
matrixA = Matrix([[_sage_const_1 , _sage_const_2 ], [_sage_const_3 , _sage_const_4 ]])
matrixB = Matrix([[_sage_const_2 , _sage_const_0 ], [_sage_const_1 , _sage_const_3 ]])
print("Matrix A:\n", matrixA)
print("Matrix B:\n", matrixB)
print("Matrix A * Matrix B:\n", matrixA * matrixB)

# Plotting
plot(sin(x) + cos(x), (x, -pi, pi), title='Plot of sin(x) + cos(x)', legend_label='sin(x) + cos(x)').show()

