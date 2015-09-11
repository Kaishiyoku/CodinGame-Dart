import 'dart:io';
import 'dart:math';

void main() {
    List inputs;
    inputs = stdin.readLineSync().split(' ');
    int lightX = int.parse(inputs[0]);
    int lightY = int.parse(inputs[1]);
    int initialTX = int.parse(inputs[2]);
    int initialTY = int.parse(inputs[3]);
    int currentTX = initialTX;
    int currentTY = initialTY;

    // game loop
    while (true) {
        String direction1 = "";
        String direction2 = "";
        int remainingTurns = int.parse(stdin.readLineSync());

        if (remainingTurns == 0) {
            break;
        }

        if (lightX < currentTX) {
            direction1 = "W";
            currentTX--;
        } else if (lightX > currentTX) {
            direction1 = "E";
            currentTX++;
        }

        if (lightY < currentTY) {
            direction2 = "N";
            currentTY--;
        } else if (lightY > currentTY) {
            direction2 = "S";
            currentTY++;
        }

        print(direction2 + direction1);
    }
}
