import 'dart:io';
import 'dart:math' as math;

void main() {
    int numberOfHorses = int.parse(stdin.readLineSync());
    List<Horse> horses = new List<Horse>();
    int closestPowerDifference = -1;

    for (int i = 0; i < numberOfHorses; i++) {
        int power = int.parse(stdin.readLineSync());

        horses.add(new Horse(power));
    }

    // sort by power
    horses.sort((Horse a, Horse b) => a.getPower().compareTo(b.getPower()));

    Horse currentHorse = horses[0];

    for (int i = 1; i < horses.length; i++) {
        Horse nextHorse = horses[i];
        int currentPowerDifference = currentHorse.getPowerDifferenceBetween(nextHorse);

        if (closestPowerDifference == -1 || currentPowerDifference < closestPowerDifference) {
            closestPowerDifference = currentPowerDifference;
        }

        currentHorse = nextHorse;
    }

    print(closestPowerDifference);
}

class Horse {
    int _power;

    Horse(this._power);

    getPowerDifferenceBetween(Horse horse) {
        return (this.getPower() - horse.getPower()).abs();
    }

    // getter / setter
    getPower() => this._power;
    setPower(int power) => this._power = power;
}
