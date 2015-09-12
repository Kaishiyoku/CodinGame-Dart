import 'dart:io';
import 'dart:math';

void main() {
    int road = int.parse(stdin.readLineSync());
    int gap = int.parse(stdin.readLineSync());
    int platform = int.parse(stdin.readLineSync());

    while (true) {
        int speed = int.parse(stdin.readLineSync());
        int coordX = int.parse(stdin.readLineSync());

        if (coordX >= road + gap && speed > 0 || speed > gap + 1) {
            print("SLOW");
        } else if (speed < gap + 1) {
            print("SPEED");
        } else if (coordX + speed > road) {
            print("JUMP");
        } else {
            print("WAIT");
        }
    }
}
