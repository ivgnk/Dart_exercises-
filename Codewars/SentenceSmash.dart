// Sentence Smash
// Напишите функцию, которая принимает массив слов,
// объединяет их в предложение и возвращает предложение.
// Вы можете игнорировать необходимость очистки слов или добавления знаков препинания,
// но вам следует добавлять пробелы между каждым словом.
// Будьте внимательны: ни в начале, ни в конце предложения не должно быть пробела!
// ['hello', 'world', 'this', 'is', 'great']  =>  'hello world this is great'
// https://www.codewars.com/kata/53dc23c68a0c93699800041d/train/dart

String smash_for(List<String> words) {
  var llen = words.length;
  String res='';
  for (var i=0;i<llen;i++){
    res = res + words[i]+' ';
  }
  return res.trim();
  // https://stackoverflow.com/questions/64399756/how-to-remove-space-at-beginning-and-end-of-a-string-in-dart
}

String smash(List<String> words) {
  String res='';
  for (var word in words){
    res = res + word+' ';
  }
  return res.trim();
  // https://stackoverflow.com/questions/64399756/how-to-remove-space-at-beginning-and-end-of-a-string-in-dart
}

void main() {
  var llst = ['hello', 'world', 'this', 'is', 'great'];
  print('Result = '+smash_for(llst));
  print('Result = '+smash(llst));
}




