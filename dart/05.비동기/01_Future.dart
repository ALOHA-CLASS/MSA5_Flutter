// 5초 지연
Future<void> fetchOrder1() async {
  // Future.delayed( 지연, 콜백함수 )
  Future.delayed(const Duration(seconds: 5), () {
    print('5초후 출력...');
  });
}

// 3초 지연
Future<void> fetchOrder2() async {
  // Future.delayed( 지연, 콜백함수 )
  Future.delayed(const Duration(seconds: 3), () {
    print('3초후 출력...');
  });
}

void main(List<String> args) {
  fetchOrder1();
  fetchOrder2();
  print('요청 중...');
}
