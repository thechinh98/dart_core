import 'dart:core';
import 'basic_java.dart';

void main() {
  List<int> intList = [1, 2, 2, 3, 3, 3, 4, 5, 10, 2, 8, 9, 0, 2, 3, 4, 7];
  List<int> trueChildList = [2, 3, 4, 7];
  List<int> wrongChildList = [1, 3, 2];
  // print("Ex1: Decending Sort ${decendingSort(intList)}");
  getPrimeFromList(intList);
  findMinAndMax(intList);
  checkNumOfPrime(intList);
  checkDivisorInList(intList);
  removeZeroFromList(intList);
  findNumOfCondition(intList, 3);
  findMaxLengthOfEqualNum(intList);
  findMaxLengthOfIncreaseNum(intList);
  print(
      "Ex12: Wrong list => ${checkSubList(wrongChildList, intList)} \n True list => ${checkSubList(trueChildList, intList)}");
}

void swapValue(int a, int b) {
  var temp = a;
  a = b;
  b = temp;
}

//Ex1
List<int> decendingSort(List<int> inputList) {
  List<int> tempList = inputList;
  for (int i = 0; i < tempList.length - 1; i++) {
    for (int j = i + 1; j < tempList.length; j++) {
      if (tempList[i] > tempList[j]) {
        // swapValue(tempList[i], tempList[j]);
        var temp = tempList[i];
        tempList[i] = tempList[j];
        tempList[j] = temp;
      }
    }
  }
  return tempList;
}

//Ex2
void getPrimeFromList(List<int> inputList) {
  Set<int> primeSet = {};
  inputList.forEach((element) {
    if (checkPrime(element)) {
      primeSet.add(element);
    }
  });
  print("Ex2: Prime number in List: $primeSet");
}

//Ex 3 & 4
void findMinAndMax(List<int> inputList) {
  if (inputList.isEmpty) {
    print("Empty List");
    return;
  }
  int min = inputList[0];
  int max = inputList[0];
  inputList.forEach((element) {
    if (element < min) {
      min = element;
    } else if (element > max) {
      max = element;
    }
  });
  print("Ex3 & 4: Max value is $max and min value is $min");
}

// Ex 5
void checkNumOfPrime(List<int> inputList) {
  int numOfPrime = 0;
  int listLength = inputList.length;
  inputList.forEach((element) {
    if (element == 1 || element == 0) {
      listLength -= 1;
    } else if (checkPrime(element)) {
      numOfPrime++;
    }
  });
  print(
      "Ex5: Num of prime number: $numOfPrime and num of composite number: ${listLength - numOfPrime}");
}

//Ex 6
void checkDivisorInList(List<int> inputList) {
  Set<int> freshSetFromList = {};
  Set<int> availableDivisorSet = {};
  // Fresh List
  inputList.forEach((element) {
    if (element != 0) {
      freshSetFromList.add(element);
    }
  });
  for (int i = 0; i < freshSetFromList.length - 1; i++) {
    for (int j = i + 1; j < freshSetFromList.length; j++) {
      if (freshSetFromList.elementAt(i) % freshSetFromList.elementAt(j) == 0) {
        availableDivisorSet.add(freshSetFromList.elementAt(j));
      } else if (freshSetFromList.elementAt(j) %
              freshSetFromList.elementAt(i) ==
          0) {
        availableDivisorSet.add(freshSetFromList.elementAt(i));
      }
    }
  }
  print("Ex6: Available divisor: $availableDivisorSet");
}

// Ex 7 : Get Max and plus 1

//Ex 8
void removeZeroFromList(List<int> inputList) {
  List<int> tempList = inputList;
  tempList.remove(0);

  print("Ex8: List after remove 0: $tempList");
}

//Ex 9
void findNumOfCondition(List<int> inputList, int n) {
  int equalNum = 0;
  int largerNum = 0;
  int smallerNum = 0;
  inputList.forEach((element) {
    if (element == n) {
      equalNum++;
    } else if (element < n) {
      smallerNum++;
    } else if (element > n) {
      largerNum++;
    }
  });
  print(
      "Ex9: Num of equal number: $equalNum, larger number: $largerNum, smaller number: $smallerNum");
}

//Ex 10
void findMaxLengthOfEqualNum(List<int> inputList) {
  int maxLength = 1;
  int indexStart = 0;
  int value = 0;
  for (int i = 0; i < inputList.length - 1; i++) {
    int tempMax = 1;
    int tempIndex = 0;
    int tempValue = 0;
    for (int j = i + 1; j < inputList.length; j++) {
      if (inputList[j] == inputList[i]) {
        tempMax++;
        tempIndex = i;
        tempValue = inputList[i];
      } else {
        break;
      }
    }
    if (tempMax > maxLength) {
      maxLength = tempMax;
      indexStart = tempIndex;
      value = tempValue;
    }
  }
  print(
      "Ex10: Max length of equal number in List: $maxLength,start at index $indexStart with value $value");
}

//Ex 11
void findMaxLengthOfIncreaseNum(List<int> inputList) {
  int maxLength = 1;
  int indexStart = 0;
  for (int i = 0; i < inputList.length - 1; i++) {
    int tempMax = 1;
    int tempIndex = 0;
    for (int j = i + 1; j < inputList.length; j++) {
      if (inputList[j] > inputList[j - 1]) {
        tempMax++;
        tempIndex = i;
      } else {
        break;
      }
    }
    if (tempMax > maxLength) {
      maxLength = tempMax;
      indexStart = tempIndex;
    }
  }
  print(
      "Ex11: Max length of increase number in List: $maxLength,start at index $indexStart");
}

//Ex 12

bool equalListWithSameLength(List<int> firstList, List<int> secondList) {
  bool checkEqual = true;
  for (int i = 0; i < firstList.length; i++) {
    if (firstList[i] != secondList[i]) {
      checkEqual = false;
    }
  }
  return checkEqual;
}

bool checkSubList(List<int> inputChildList, List<int> inputParentList) {
  bool trueSubList = false;
  for (int i = 0; i < inputParentList.length - inputChildList.length + 1; i++) {
    if (inputParentList[i] == inputChildList[0]) {
      trueSubList = equalListWithSameLength(
          inputParentList.sublist(i, inputChildList.length + i),
          inputChildList);
    }
  }
  return trueSubList;
}
