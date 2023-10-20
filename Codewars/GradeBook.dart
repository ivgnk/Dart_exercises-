// Журнал оценок. Завершите функцию так, чтобы она находила среднее значение
// трех переданных ей оценок и возвращала буквенное значение,
// связанное с этой оценкой.
// Numerical Score	Letter Grade
// 90 <= score <= 100	'A'
// 80 <= score < 90	'B'
// 70 <= score < 80	'C'
// 60 <= score < 70	'D'
// 0 <= score < 60	'F'
// Tested values are all between 0 and 100.
// Theres is no need to check for negative values or values greater than 100.

String getGrade(int a, int b, int c) {
  double dat = ((a+b+c)/3);
  String res;
  if ((0<=dat) & (dat<60))  res = 'F';
  else if ((60<=dat) & (dat<70))  res = 'D';
  else if ((70<=dat) & (dat<80))  res = 'C';
  else if ((80<=dat) & (dat<90))  res = 'B';
        else res = 'A';
  print(res);
  return res;
  // your code here
}
void main(){
  print('Result = ${getGrade(95, 90, 93)}');  // A
  print('Result = ${getGrade(100, 85, 96)}'); // A
}
