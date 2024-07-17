void main() {
  List<int> list = [1, 2, 3, 4, 5];
  print("list : $list");

  // 리스트 요소 접근 및 수정
  list[0] = 100;
  print("list: ${list[0]}");

  // 리스트 길이
  print("리스트 길이 : ${list.length}");

  // 리스트 요소 추가
  list.add(55);
  print("list : $list");

  // 리스트 요소 제거
  list.remove(55); // 값 55 제거
  print("list : $list");

  list.removeAt(3); // index : 3 인 요소 제거
  print("list : $list");
}
