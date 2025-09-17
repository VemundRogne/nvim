"""
This file is only a testing file to check if the debugger works as intended
"""
import time

import numpy as np

def add_two_numbers(a: int , b: int) -> int:
    return a + b


a = np.array([1, 2, 3])

number = 0
for i in range(1000):
    number = add_two_numbers(i, number)
    print(f"Current number: {number}")
    time.sleep(0.1)

print(f"Final number: {number}")

