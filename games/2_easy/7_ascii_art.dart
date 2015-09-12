import 'dart:io';
import 'dart:math';

void main() {
    int L = int.parse(stdin.readLineSync());
    int H = int.parse(stdin.readLineSync());
    String T = stdin.readLineSync();
    ASCII ascii = new ASCII(L, H, T, print);
    ascii.init();
    ascii.printT();
}

class ASCII {
    String _alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ?";
    int _L;
    int _H;
    String _T;
    List<String> _charList = new List<String>();
    Function printFn;

    ASCII(this._L, this._H, this._T, this.printFn);

    void init() {
        for (int i = 0; i < this._H; i++) {
            _charList.add(stdin.readLineSync());
        }
    }

    String printT() {
        List<String> wordList = new List<String>(_charList.length);

        for (int i = 0; i < this._T.length; i++) {
            String currentChar = this._T[i];

            for (int k = 0; k < _charList.length; k++) {
                if (wordList[k] == null) {
                    wordList[k] = "";
                }

                int startIndex = this._L * _getAlphabetIndexOf(currentChar);
                int endIndex = this._L * _getAlphabetIndexOf(currentChar) + this._L;

                wordList[k] += _charList[k].substring(startIndex, endIndex);
            }
        }

        wordList.forEach((String line) {
           printFn(line);
        });
    }

    int _getAlphabetIndexOf(String char) {
        int index = _alphabet.indexOf(char.toUpperCase());

        if (index == -1) {
            index = _alphabet.length - 1; // return index of "?" when no char matches
        }

        return index;
    }
}
