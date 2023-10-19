// Создайте функцию, которая будет возвращать оператор приветствия,
// использующий входные данные; ваша программа должна вернуть
// сообщение «Привет, <имя>, как дела сегодня?».
// [Убедитесь, что вы вводите именно то,
// что я написал, иначе программа может работать неправильно]
// https://www.codewars.com/kata/55a70521798b14d4750000a4/train/dart

String greet(String name) {
  String res = "Hello, ${name} how are you doing today?";
  return res;
}

void main(){
  String llst = "Ryan";
  print('Result = '+greet(llst));
}
