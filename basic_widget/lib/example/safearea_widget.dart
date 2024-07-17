import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SafeareaWidget extends StatelessWidget {
  const SafeareaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 상태바 숨기기
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    return SafeArea(
      // 안전영역 사용여부
      // - top, bottom, left, right : 안전영역 사용방향 지정
      top: true,        
      bottom: true,
      left: false,
      right: false,
      minimum: const EdgeInsets.all(10), // 최소 패딩
      maintainBottomViewPadding: true,   // 하단 뷰 패딩 유지할지 여부
      child: Scaffold(
              body: Container(
                height: 1000,
                color: Colors.blue,
              ),
            ),
    );
  }
}