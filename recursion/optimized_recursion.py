def runner():
  num = int(input("Number for factorial: "))
  total = 1
  fact = factorial(num, total)
  print("Factorial is",fact)

def factorial(num, total):
  if num == 0:
    return total
  else: 
    return factorial(num -1, total * num)

runner()