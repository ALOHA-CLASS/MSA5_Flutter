import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("홈 화면"),),
      body: const Center(
        child: Text(
          "홈 화면",
          style: TextStyle(fontSize: 30.0),
        )
      ),
      bottomSheet: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                // 라우팅 경로로 화면 이동
                // * arguments : 화면 이동 시 전달할 데이터 지정
                Navigator.pushNamed(context, "/user", arguments: 'user');
              }, 
              child: const Text("마이 페이지")
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/community", arguments: 'community');
              }, 
              child: const Text("커뮤니티")
            ),
          ],
        ),
      ),
    );
  }
}