import 'dart:io';
import 'dart:math';

void main() {
    List inputs;
    int numberOfMimeTypes = int.parse(stdin.readLineSync()); // Number of elements which make up the association table.
    int numberOfFileNames = int.parse(stdin.readLineSync()); // Number Q of file names to be analyzed.
    Map<String, String> mimes = new Map<String, String>();

    for (int i = 0; i < numberOfMimeTypes; i++) {
        inputs = stdin.readLineSync().split(' ');

        String extension = inputs[0];
        String mimeType = inputs[1];

        mimes["." + extension] = mimeType;
    }

    //print(mimes);

    for (int i = 0; i < numberOfFileNames; i++) {
        try {
            String fileName = stdin.readLineSync();
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));

            // try lower and upper case
            String mimeType = mimes[fileExtension.toLowerCase()];

            if (mimeType == null) {
                mimeType = mimes[fileExtension.toUpperCase()];
            }

            if (mimeType != null) {
                print(mimeType);
            } else {
                print("UNKNOWN");
            }
        } catch (e) {
            print("UNKNOWN");
        }
    }
}
