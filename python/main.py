# %%
import math
def f_native(x_values):
    y_values = []
    for x in x_values:
        y = math.exp(x)*math.sin(x)*x + x**4 + 5 * math.sqrt(3*x)
        y_values.append(y)
    return y_values
# %%
import numpy as np
def f_np(x):
    return np.exp(x)*np.sin(x)*x + x**4 + 5 * np.sqrt(3*x)

# %%
x_values = [i/2**16 for i in range(2**16)]
# %%
%%timeit -n 10
f_native(x_values)
# 52.5 ms ± 446 µs per loop (mean ± std. dev. of 7 runs, 10 loops each)
# %%
x_numpy = np.array(x_values)
# %%
%%timeit -n 10
f_np(x_numpy)
# 3.16 ms ± 29.2 µs per loop (mean ± std. dev. of 7 runs, 10 loops each)