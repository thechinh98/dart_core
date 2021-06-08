import 'dart:core';

void main() {
  double inputValue = 3;
  print("Ex1 result: ${calcEx1(inputValue)}");
  print("Ex2 result: ${calcEx2(inputValue)}");
  print("Ex3 result:${calcEx3(inputValue)}");
  print("Ex4 result: ${findFibonacciByIndex(4)}");
}

double calcEx1(double n) {
  if (n > 1) {
    return calcEx1(n - 1) + 1 / calcSumFromOne(n);
  }
  return n;
}

double calcSumFromOne(double n) {
  if (n > 1) {
    return calcSumFromOne(n - 1) + n;
  }
  return n;
}

double calcFactorial(double n) {
  if (n > 1) {
    return calcFactorial(n - 1) * n;
  }
  return n;
}

double calcEx2(double n) {
  if (n > 1) {
    return calcEx2(n - 1) + 1 / calcFactorial(n);
  }
  return n;
}

double calcSumOfFactorial(double n) {
  if (n > 1) {
    return calcSumOfFactorial(n - 1) + calcFactorial(n);
  }
  return n;
}

double calcEx3(double n) {
  if (n > 1) {
    return calcEx3(n - 1) + 1 / calcSumOfFactorial(n);
  }
  return n;
}

int findFibonacciByIndex(double index) {
  if (index == 1) {
    return 1;
  } else if (index == 2) {
    return 2;
  } else {
    return (findFibonacciByIndex(index - 1) + findFibonacciByIndex(index - 2));
  }
}
