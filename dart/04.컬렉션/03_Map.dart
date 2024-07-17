void main() {
  // Map 선언
  Map<String, int> map = {"김조은": 100, "김유정": 90, "이정용": 50};

  // 요소 접근 및 수정
  print("김조은의 성적 : ${map['김조은']}");
  map['김조은'] = 99;
  print("map : $map");

  // 요소 추가
  map['백승헌'] = 77;
  print("map : $map");

  // 요소 제거
  map.remove("김조은");
  print("map : $map");
}
