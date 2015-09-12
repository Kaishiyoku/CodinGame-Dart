import 'dart:io';
import 'dart:math' as math;

void main() {
    String userLongitude = stdin.readLineSync();
    String userLatitude = stdin.readLineSync();
    int numberOfDefibrillators = int.parse(stdin.readLineSync());
    Position userPosition = new Position.fromString(userLongitude, userLatitude);
    Defibrillator closestDefibrillator = null;

    for (int i = 0; i < numberOfDefibrillators; i++) {
        List<String> defibrillatorList = stdin.readLineSync().split(";");

        int id = int.parse(defibrillatorList[0]);
        String name = defibrillatorList[1];
        String address = defibrillatorList[2];
        String phoneNumber = defibrillatorList[3];
        double longitude = double.parse(defibrillatorList[4].replaceAll(",", "."));
        double latitude = double.parse(defibrillatorList[5].replaceAll(",", "."));

        Defibrillator defibrillator = new Defibrillator(id, name, address, phoneNumber, longitude, latitude);

        if (closestDefibrillator == null ||
            defibrillator.getPosition().getDistanceFrom(userPosition) < closestDefibrillator.getPosition().getDistanceFrom(userPosition)) {
            closestDefibrillator = defibrillator;
        }
    }

    print(closestDefibrillator.getName());
}

class Defibrillator {
    int      _id;
    String   _name;
    String   _address;
    String   _phoneNumber;
    double   _longitude;
    double   _latitude;
    Position _position;

    Defibrillator(this._id, this._name, this._address, this._phoneNumber, this._longitude, this._latitude) {
        _position = new Position(this._longitude, this._latitude);
    }

    // getter / setter
    getId() => this._id;
    setId(int id) => this._id = id;

    getName() => this._name;
    setName(String name) => this._name = name;

    getAddress() => this._address;
    setAddress(String address) => this._address = address;

    getPhoneNumber() => this._phoneNumber;
    setPhoneNumber(String phoneNumber) => this._phoneNumber = phoneNUmber;

    getLongitude() => this._longitude;
    setLongitude(double longitude) => this._longitude = longitude;

    getLatitude() => this._latitude;
    setLatitude(double latitude) => this._latitude = latitude;

    getPosition() => this._position;
    setPosition(Position position) => this._position = position;
}

class Position {
    static final double EARTH_RADIUS = 6371.0;
                 double _longitude;
                 double _latitude;

    Position(this._longitude, this._latitude);

    Position.fromString(String longitude, String latitude) {
        this._longitude = double.parse(longitude.replaceAll(",", "."));
        this._latitude = double.parse(latitude.replaceAll(",", "."));
    }

    double getDistanceFrom(Position position) {
        double distanceLongitude = _toRad(position.getLongitude() - this.getLongitude());
        double distanceLatitude = _toRad(position.getLatitude() - this.getLatitude());
        double a = math.sin(distanceLatitude / 2) * math.sin(distanceLatitude / 2) +
                   math.cos(_toRad(this.getLatitude())) * math.cos(_toRad(position.getLatitude())) *
                   math.sin(distanceLongitude / 2) * math.sin(distanceLongitude / 2);
        double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
        double distance = Position.EARTH_RADIUS * c;

        return distance;
    }

    double _toRad(x) {
        return x * (math.PI) / 180;
    }

    // getter / setter
    getLongitude() => this._longitude;
    setLongitude(double longitude) => this._longitude = longitude;

    getLatitude() => this._latitude;
    setLatitude(double latitude) => this._latitude = latitude;
}
