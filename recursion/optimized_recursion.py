# What we whiteboarded with single recursive call
def factorial(num, accumulation = 1):
  if num == 0:
    return accumulation
  else:
    return factorial(num -1, accumulation*num)
# print(factorial(1000, 1))    #=> Stack Limit

# Non Recursive method, sort of a "recursive loop" using a single call
def loop_factorial(num, accumulation=1):
  while num > 1:
    (num, accumulation) = (num-1, accumulation * num)
  return accumulation
# print(loop_factorial(1000)) #=> Prints factorial

# Trampoline Solution

###Trampoline Functions
import functools

def call(f):
    def g(*args, **kwds):
        return f, args, kwds
    return g

def result(value):
    return None, value, None

def with_trampoline(func):
    @functools.wraps(func)
    def g(*args, **kwds):
        h = func
        while h is not None:
            h, args, kwds = h(*args, **kwds)
        return args
    return g
####Trampoline Functions end

def jumping_factorial(num, accumulation=1):
  if num == 0 : 
    return result(accumulation)
  return call(factorial_with_trampoline)(num-1, num * accumulation)

factorial = with_trampoline(jumping_factorial)

# print(factorial(1000)) #=> Will print out the full factorial