import 'dart:core';
import 'dart:math';

void main() {
  int x = 100;
  divideToPrime(x);
}

bool checkPrime(int x) {
  if (x <= 1) {
    return false;
  }
  for (int i = 2; i <= sqrt(x); i++) {
    if (x % i == 0) {
      return false;
    }
  }
  return true;
}

void divideToPrime(int n) {
  Set<int> primeList = {};
  for (int i = 2; i < n; i++) {
    while (n % i == 0 && checkPrime(i)) {
      print("$i");
      n ~/= i;
      primeList.add(i);
    }
  }
  print("Prime List: $primeList");
}
