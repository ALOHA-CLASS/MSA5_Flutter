void main() {
  Set<String> sets = {"김슬기", "박은서", "이종식"};
  print("프로 지각러 : $sets");

  sets.add("박은서"); // 요소 추가 (중복 불가)
  print("sets : $sets");

  sets.remove("이종식"); // 요소 제거
  print("sets : $sets");
}
