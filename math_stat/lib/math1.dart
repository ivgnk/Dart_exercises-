import 'dart:math';
import 'package:intl/intl.dart';
import 'dart:io';
import 'dfile.dart';

void theMathLoc() {
  print('\n--- theMathLoc ---');
  var lst = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print('lst = $lst');
  print('lst.reduce(min) = ${lst.reduce(min)}');
  print('lst.reduce(max) = ${lst.reduce(max)}');

  // https://www.woolha.com/tutorials/dart-copy-clone-list-shallow-deep-examples
  // shallow copy only for immutable such as String, bool, int, or bool
  var lst2 = List.of(lst);

  print('\n--- for cycle');
  print('index, item    lst[index]      lst2[index]');
  for (final (index, item) in lst.indexed) {
    lst2[index] = lst[index] * lst[index];
    print(
        '$index      $item          ${lst[index]}               ${lst2[index]} ');
  }

  print('\n--- forEach()');
  lst.forEach(print);

  // https://dev.to/codingpizza/powerful-list-functions-in-dart-that-you-should-know-4h4o => Map
  print('\n list.map');
  var theSet = {1, 2, 3, 4};
  var list = List.of(theSet);
  var mappedList = list.map((number) => number * 2);
  print(mappedList);
  print('mappedList.runtimeType = ${mappedList.runtimeType}');
  var list2 = List.of(mappedList);
  print('list2.runtimeType = ${list2.runtimeType}');
  print(list2);
}

// https://stackoverflow.com/questions/33905268/returning-a-string-from-an-async
String workWithFile_write(List<int> intList, List<double> dblList) {
  // Работа с файлами
  // https://metanit.com/dart/tutorial/8.2.php
  print('\n--- workWithFile_write ---');
  var dirCurr = Directory.current;
  var dirCurrS = dirCurr.path;
  print('$dirCurrS ${dirCurrS.runtimeType}');
  var fn = dirCurrS + '\\dat.txt';
  print('fn = $fn');
  File file = File(fn);
  bool fe = file.existsSync();
  print('file.existsSync= $fe');
  if (fe) {
    print('file.exists() = $fe , fe.runtimeType =  ${fe.runtimeType}');
    file.delete();
  } else {
    file.create();
  }
  file.writeAsStringSync("Data File \n", mode: FileMode.append);

  // https://stackoverflow.com/questions/43834979/writing-to-a-file-through-a-loop-in-dart
  var lstLen = intList.length;
  var ils, dls, iss, s;
  for (var i = 0; i <= (lstLen - 1); i++) {
    ils = intList[i].toString().padLeft(2, ' ');
    dls = dblList[i].toString().padRight(20, ' ');
    iss = i.toString().padLeft(2, ' ');
    s = '$iss dbl  $dls       int  $ils \n';
    file.writeAsStringSync(s, mode: FileMode.append);
  }
  print('return fn = $fn');
  return fn;
}

(List<int>, List<double>, int) workWithFile_read(String fname) {
  // https://stackoverflow.com/questions/62083727/how-to-return-multiple-values-from-function-in-dart
  print('\n--- workWithFile_read ---');
  List<String> llst;
  int nwords;
  List<int> intList = [];
  List<double> dblList = [];

  // https://stackoverflow.com/questions/60438580/can-you-convert-a-futurestring-to-a-string-flutter-dart
  int numLnInF = numLinesInFile(fname);
  print('numLinesInFile =  $numLnInF');
  var lines = File(fname).readAsLinesSync();
  print('lines = ${lines.runtimeType}');

  for (var i = 1; i <= (numLnInF - 1); i++) {
    // т.к. 0 строка - только текст
    llst = lines[i].split(' ');
    llst.removeWhere((dat) => (dat == ''));
    // print(lines[i]);
    // print('- $i   ${llst[2]}   ${llst[4]}');
    dblList.add(double.parse(llst[2]));
    intList.add(int.parse(llst[4]));
  }
  print('end of workWithFile_read');
  return (intList, dblList, numLnInF - 1);
}

void printLists(List<int> intList, List<double> dblList) {
  print('\n--- printLists ---');
  print('N  intList           dblList');
  int ndat = intList.length;
  for (var i = 0; i <= ndat - 1; i++) {
    print('$i     ${intList[i]}          ${dblList[i]}');
  }
}

void theRandomLoc(List<bool> lst) {
  // https://metanit.com/dart/tutorial/5.1.php
  List<double> dblList = [];
  List<int> intList = [];
  List<double> dblList2 = [];
  List<int> intList2 = [];
  print('\n--- theRandomLoc ---');

  if (lst[0]) {
    // https://pub.dev/documentation/intl/latest/intl/NumberFormat-class.html
    print('\n-- format');
    var f = NumberFormat("###.#####");
    var s = f.format(12.345);
    print('s = $s');
    s = f.format(12);
    print('s = $s');
    print('s.runtimeType = ${s.runtimeType}');
  } else {
    print('\n-- format disabled');
  }

  if (lst[1]) {
    // https://dart.dev/guides/libraries/library-tour#dartmath---math-and-random
    print('\n-- random');
    var random = Random();
    var fd = NumberFormat("0.000000");

    dynamic dat, dat2;
    String dats, dat2s, isstr;
    for (var i = 1; i < 11; i++) {
      dat = random.nextDouble();
      dblList.add(dat);
      dats = fd.format(dat); // Between 0.0 and 1.0: [0, 1)
      dat2 = random.nextInt(10); // Between 0 and 9
      // print(dat2.runtimeType);
      intList.add(dat2);
      dat2s = dat2.toString();
      dat2s = dat2s.padLeft(2, ' ');
      isstr = i.toString();
      isstr = isstr.padLeft(2, ' ');
      print('$isstr  dbl  $dats       int  $dat2s');
    }
  } else {
    print('\n-- random disabled');
  }
  var wwf = '\n-- work with files';
  if (lst[2]) {
    //--------- (1)
    print(wwf);
    if (dblList.isNotEmpty && intList.isNotEmpty) {
      var fnra = workWithFile_write(intList, dblList);
      int ndat;
      (intList2, dblList2, ndat) = workWithFile_read(fnra);
      printLists(intList2, dblList2);
    } else {
      print('$wwf disabled');
    }
  }
}
