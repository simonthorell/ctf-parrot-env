# Sample SageMath Script: example.sage

# Arithmetic operations
a = 8
b = 3
print(f"{a} + {b} = {a + b}")
print(f"{a} - {b} = {a - b}")
print(f"{a} * {b} = {a * b}")
print(f"{a} / {b} = {a / b}")

# Matrix operations
matrixA = Matrix([[1, 2], [3, 4]])
matrixB = Matrix([[2, 0], [1, 3]])
print("Matrix A:\n", matrixA)
print("Matrix B:\n", matrixB)
print("Matrix A * Matrix B:\n", matrixA * matrixB)

# Plotting
plot(sin(x) + cos(x), (x, -pi, pi), title='Plot of sin(x) + cos(x)', legend_label='sin(x) + cos(x)').show()