// тестирование работы со строками

void testSplit1() {
  print('\n--- testSplit1 ---');
  var s = "1 2 3 4 5 6 7 8 9 10";
  s = "0 dbl  0.4226129156714715         int   1 ";
  print('s = $s \n');

  var sw = ' ';
  var lst = s.split(' ');
  print('lst after split = $lst');
  // https://www.kindacode.com/article/how-to-remove-items-from-a-list-in-dart/
  lst.removeWhere((dat) => (dat == ''));
  print('lst after remove = $lst');
  print('lst.length = ${lst.length} \n');

  print('lst = $lst');
  print(s.codeUnits);
  print(sw.codeUnits);
}
