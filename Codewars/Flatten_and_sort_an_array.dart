// Given a two-dimensional array of integers, return the flattened version
// of the array with all the integers in the sorted (ascending) order.
// Example:
// Given [[3, 2, 1], [4, 6, 5], [], [9, 7, 8]],
// your function should return [1, 2, 3, 4, 5, 6, 7, 8, 9].

List<int> flattenAndSort(List<List<int>> nums) {
  List<int> res_, curr;
  var i;
  res_ = [];
  for (curr in nums) {
    for (i in curr) res_.add(i);
  }
  res_.sort();
  return res_;
}

void main() {
  print('Result = ' + flattenAndSort([]).toString());
  print('Result = ' + flattenAndSort([[]]).toString());
  print('Result = ' + flattenAndSort([[], []]).toString());
  print('Result = ' +
      flattenAndSort([
        [],
        [1]
      ]).toString());
  print('Result = ' +
      flattenAndSort([
        [],
        [],
        [],
        [2],
        [],
        [1]
      ]).toString());
  print('Result = ' +
      flattenAndSort([
        [3, 2, 1],
        [7, 9, 8],
        [6, 4, 5]
      ]).toString());
}
