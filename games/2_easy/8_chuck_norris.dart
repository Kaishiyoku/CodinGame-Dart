import 'dart:io';
import 'dart:math';
import 'dart:convert';

void main() {
    String message = stdin.readLineSync();

    print(convertToUnary(convertToBinary(message)));
}

String convertToBinary(String message) {
    return message.codeUnits.map((x) => x.toRadixString(2).padLeft(7, '0')).join();
}

String convertToUnary(String binary) {
    String currentChar = binary[0];
    String unary = unaryMap[currentChar] + " 0";

    for (int i = 1; i < binary.length; i++) {
        String nextChar = binary[i];

        unary += currentChar == nextChar ? "0" : " " + unaryMap[nextChar] + " 0";

        currentChar = nextChar;
    }

    return unary;
}

Map<String, String> unaryMap = <String, String>{
    "0" : "00",
    "1" : "0"
};
