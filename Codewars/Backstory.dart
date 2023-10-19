//  Задача Ваша задача проста: если х в квадрате больше 1000,
//  верните «Жарче солнца!!», иначе верните «Помоги себе сотового йорка в
//  перчаточном ящике».
//  Примечание. Ввод будет либо положительным целым числом
//  (или строкой для нетипизированных языков).

String apple(dynamic a) {
  int b;
  if (a.runtimeType==String){
    b = int.parse(a);
  }
    else {b = a;}
  if (b*b > 1000) {
    return "It's hotter than the sun!!";
  }
  else {
    return 'Help yourself to a honeycomb Yorkie for the glovebox.';
  }
}

void main(){
  print('Result = ${apple(2)}');
  print('Result = ${apple(50)}');
}
