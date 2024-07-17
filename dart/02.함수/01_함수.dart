// 반환타입 함수명(매개변수) { }
int sum(int a, int b, int c) {
  return a + b + c;
}

main() {
  print("기본 함수 정의");
  int result = sum(1, 2, 3);
  print("sum : $result");
}
