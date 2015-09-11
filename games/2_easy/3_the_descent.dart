import 'dart:io';
import 'dart:math';

void main() {
    List inputs;

    while (true) {
        inputs = stdin.readLineSync().split(' ');
        int spaceX = int.parse(inputs[0]);
        int spaceY = int.parse(inputs[1]);
        int highestMountainIndex = -1;
        int highestMountainH = -1;
        for (int i = 0; i < 8; i++) {
            int mountainH = int.parse(stdin.readLineSync());

            if (mountainH > highestMountainH) {
                highestMountainH = mountainH;
                highestMountainIndex = i;
            }
        }

        if (spaceX == highestMountainIndex) {
            print("FIRE");
        } else {
            print("HOLD");
        }
    }
}
