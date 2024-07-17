import 'package:flutter/material.dart';
import 'package:layout_widget/models/student.dart';

class DetailScreen extends StatelessWidget {
  final Student student;
  const DetailScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("상세화면"),),
      body: Container(
        margin: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 280,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(student.imagePath ?? "image/logo.png"),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              
            ),
            const SizedBox(height: 12.0,),
            Text(
              student.name ?? "이름 없음",
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0,),
            Text(
              "나는 ${student.age} 살입니다.",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0,),
            Text(
              student.isGraduated ?? false ? '졸업O' : '졸업X',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        )
      )
    );
  }
}