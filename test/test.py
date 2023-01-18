"""
This file is only a testing file to check if the debugger works as intended
"""

def add_two_numbers(a: int , b: int) -> int:
    return a + b


a = 2
b = int(input('Please enter an integer: '))

c = 0
c = add_two_numbers(a, b)

print(f"I added {a} and {b} and got {c}")
