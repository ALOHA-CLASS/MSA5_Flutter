import 'package:flutter/material.dart';
import 'package:navigation_widget/models/user.dart';
import 'package:navigation_widget/screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = User(id: 'joeun', name: '김조은');

    return Scaffold(
      appBar: AppBar(title: const Text("첫 페이지"),),
      body: const Center(
        child: const Text("첫 페이지"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context, 
          //   MaterialPageRoute(
          //     // 페이지 이동 시,
          //     // 생성자의 매개변수를 통해서 데이터를 전달
          //     builder: (BuildContext context) => const SecondScreen(data: '넘겨준 데이터')
          //   )
          // );
          // 애니메이션 적용해서 페이지 이동
          Navigator.push(context, _createRoute());
        },
        child: const Icon(Icons.arrow_forward),
      ),

    );
  }

  // Route 생성 함수
  Route _createRoute() {
    return PageRouteBuilder(
      // 이동할 페이지 지정
      pageBuilder: (context, animation, secondaryAnimation) 
        => const SecondScreen(data: '데이터'),
      
      // 애니메이션 지정
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Offset(x축, y축) : 0.0 ~ 1.0
        const begin = Offset(1.0, 0.0);   // 시작점
        const end = Offset.zero;          // 끝점
        const curve = Curves.ease;        // 애니메이션 속도 곡선

        // Tween : 애니메이션을 적용하는 설정 객체
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        // 위젯을 애니메이션을 통해 이동시키는 객체
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
    );
  }
}