// Библиотека функций для работы с файлами
import 'dart:io';

int numLinesInFile(String fn) {
  File file = File(fn);
  bool fe = file.existsSync();
  if (fe) {
    return file.readAsLinesSync().length;
  } else {
    return -1;
  }
}

void fileExistTestSync() {
  String fn = 'D:/Work_Lang/Dart_Flutter/math_stat/dat.txt';
  File file = File(fn);
  bool fe = file.existsSync();
  if (fe) {
    print("Файл существует");
  } else {
    print("Файл не существует");
  }
}
