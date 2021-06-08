import 'dart:convert';
import 'dart:core';

void main() {
  String name = "Le The12  Chinh";
  String binaryString = "1010101010";

  // For Ex 8
  String givenString = "abcabcasdsascasabcasacb";
  String subString = "abc";
  List<String> givenListString = ["a", "a", "ABC", "AAAA", "A"];
  List<String> givenStringName = [
    "Le Dinh An",
    "Le Thi Hai",
    "Bui Bao An",
    "Le Thi Yen",
    "Le Thi Quynh",
    "Le Van Hai"
  ];
  String translateString = "11110000";
  print("$name");
  replaceExtraSpace(name);
  print("Ex2: Contain SubString: ${checkSubString("Chinh", name)}");
  separateName(name);
  swapBinaryValue(binaryString);
  reverseString(name);
  checkNumOrNot(name);
  countNumOfSubString(subString, givenString);
  swapTwoChar(0, 3, name);
  getLongestString(givenListString);
  getStudentByFirstName(givenStringName);
  getStudentByMiddleName(givenStringName);
  getStudentByChar(givenStringName);
  translationString(4, translateString);
  addStringToMiddleString(name, subString);
}

// Ex1
String replaceExtraSpace(String name) {
  String tempName = name.replaceAll("  ", " ");
  print("Ex1\n$tempName");
  return tempName;
}

// Ex2
bool checkSubString(String subString, String inputString) {
  return inputString.contains(subString);
}

// Ex3 & 4
String getFirstName(String name) {
  List<String> tempName = name.replaceAll("  ", " ").split(" ");
  return tempName[tempName.length - 1];
}

String getLastName(String name) {
  List<String> tempName = name.replaceAll("  ", " ").split(" ");
  return tempName[0];
}

String getMiddleName(String name) {
  List<String> tempName = name.replaceAll("  ", " ").split(" ");
  return tempName[1];
}

void separateName(String name) {
  print("Ex3: First name: ${getFirstName(name)}");
  print("Ex4: Last name: ${getLastName(name)}");
}

// Ex5
void swapBinaryValue(String binaryString) {
  List<String> tempStringList = binaryString.split('');
  for (int i = 0; i < tempStringList.length; i++) {
    if (tempStringList[i] == "0") {
      tempStringList[i] = "1";
    } else if (tempStringList[i] == "1") {
      tempStringList[i] = "0";
    }
  }
  String resultString = tempStringList.join();
  print("Ex5: After swap: $resultString");
}

// Ex6
void reverseString(String inputString) {
  print("Ex6: Reverse String: ${inputString.split("").reversed.join()}");
}

// Ex7
void checkNumOrNot(String inputString) {
  List<String> tempStringList = inputString.split('');
  for (int i = 0; i < tempStringList.length; i++) {
    if (double.tryParse(tempStringList[i]) != null) {
      tempStringList[i] = "\$";
    }
  }
  String resultString = tempStringList.join();
  print("Ex7: After change: $resultString");
}

// Ex8
void countNumOfSubString(String subString, String inputString) {
  String resultString = inputString.replaceAll(subString, "\$");
  List<String> inputListString = resultString.split('');
  int numOfSubString = 0;
  inputListString.forEach((element) {
    if (element == "\$") {
      numOfSubString++;
    }
  });
  print("Ex8: Number Of SubString: $numOfSubString");
}

//Ex9
void swapTwoChar(int index1, int index2, String inputString) {
  List<String> inputListString = inputString.split('');
  String temp = inputListString[index1];
  inputListString[index1] = inputListString[index2];
  inputListString[index2] = temp;

  print("Ex9: String after swap 2 char: ${inputListString.join()}");
}

//Ex10
void getLongestString(List<String> inputListString) {
  String resultString = "";
  int max = 0;
  for (int i = 0; i < inputListString.length; i++) {
    if (inputListString[i].length > max) {
      resultString = inputListString[i];
      max = inputListString[i].length;
    }
  }
  print("Ex10: Longest String: $resultString");
}

//Ex11
void getStudentByFirstName(List<String> inputStudentString) {
  int count = 0;
  for (int i = 0; i < inputStudentString.length; i++) {
    if (getFirstName(inputStudentString[i]) == "An") {
      count++;
    }
  }
  print("Ex11: Number of Student who name's An: $count");
}

// Ex12
void getStudentByMiddleName(List<String> inputStudentString) {
  int count = 0;
  for (int i = 0; i < inputStudentString.length; i++) {
    if (getMiddleName(inputStudentString[i]) == "Thi") {
      count++;
    }
  }
  print("Ex12: Number of Student who middle name's Thi: $count");
}

//Ex13
void getStudentByChar(List<String> inputStudentString) {
  int count = 0;
  for (int i = 0; i < inputStudentString.length; i++) {
    if (getFirstName(inputStudentString[i]).split('')[0] == "H") {
      count++;
    }
  }
  print("Ex13: Num of Student whose name begins with H: $count");
}

//Ex14
void translationString(int n, String inputString) {
  int getRealTranslation = n % inputString.length;
  List<String> tempString = inputString.split('');
  List<String> resultString = inputString.split('');
  for (int i = 0; i < inputString.length; i++) {
    if (i + getRealTranslation >= tempString.length) {
      resultString[i - (tempString.length - getRealTranslation - 1)] =
          tempString[i];
    } else {
      resultString[i + getRealTranslation] = tempString[i];
    }
  }
  print(
      "Ex14:\nString before rotate: ${inputString}\nString after rotate: ${resultString.join()}\nNum of Translation: $n");
}

//Ex15
void addStringToMiddleString(String inputString, String addString) {
  int inputStringLength = inputString.length;
  String resultString = inputString.substring(0, inputStringLength ~/ 2) +
      addString +
      inputString.substring(inputStringLength ~/ 2);
  print(
      "Ex16: Init string: $inputString, add String: $addString \nResult: $resultString");
}
//Ex16 su dung ham SubString
