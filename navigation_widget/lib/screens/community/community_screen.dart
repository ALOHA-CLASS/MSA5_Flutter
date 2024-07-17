import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // 데이터 전달받기
    String? data = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: const Text("커뮤니티"),),
      body: Center(
        child: Text(
          "커뮤니티 : $data",
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
                // 1. 스택에 새 화면을 추가
                // Navigator.pushNamed(context, "/home", arguments: 'home');
                
                // 2. 현재 화면 제거 후, 새 화면을 추가
                // Navigator.pop(context);   // 현재 화면 스택에서 제거
                // Navigator.pushNamed(context, "/home", arguments: 'home');

                // 3. 현재 화면을 새 화면으로 대체
                Navigator.pushReplacementNamed(context, "/home");
              }, 
              child: const Text("홈 화면")
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/community", arguments: 'community');
              }, 
              child: const Text("커뮤니티")
            ),
          ],
        ),
      ),
    );
  }
}