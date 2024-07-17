void main() {
  var add = (int a, int b) => a + b;
  print("add() 호출 결과 : ${add(10, 20)}");

  List<int> list = [1, 2, 3, 4, 5];
  List<int> newList = list.map((item) => item * 2).toList();
  print("newList : $newList");
}
