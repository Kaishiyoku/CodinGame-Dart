import 'dart:io';
import 'dart:math';
import 'dart:core';

void main() {
    int n = int.parse(stdin.readLineSync()); // the number of temperatures to analyse
    String temps = stdin.readLineSync(); // the n temperatures expressed as integers ranging from -273 to 5526

    List<int> tempList = temps.split(" ");

    print(getSmallestTemp(tempList));
}

int getSmallestTemp(List<int> tempList) {
    int smallestTemp = null;

    tempList.forEach((String tempStr) {
        int temp = int.parse(tempStr, onError:(source) {

        });

        if (smallestTemp == null) {
            smallestTemp = temp;
        } else if ((temp.abs() < smallestTemp.abs()) ||
                   (temp > 0 && smallestTemp < 0 && temp.abs() == smallestTemp.abs())) {
            smallestTemp = temp;
        }
    });

    if (smallestTemp == null) {
        smallestTemp = 0;
    }

    return smallestTemp;
}
