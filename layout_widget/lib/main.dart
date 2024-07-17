import 'package:flutter/material.dart';
import 'package:layout_widget/models/student.dart';
import 'package:layout_widget/screens/detail_screen.dart';
import 'package:layout_widget/screens/gridview_screen.dart';
import 'package:layout_widget/screens/listview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // 🧊 state
  List<Student> studentList = [];

  @override
  void initState() {
    super.initState();

    studentList.add( Student(
      imagePath: "image/student1.jpg", 
      name: '파이리',
      age: 10
    ));
    studentList.add( Student(
      imagePath: "image/student2.webp", 
      name: '꼬부기',
      age: 15
    ));
    studentList.add( Student(
      imagePath: "image/student3.webp", 
      name: '이상해씨',
      age: 12
    ));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "상세화면",
      home: ListviewScreen(list: studentList,)
            // GridviewScreen(list: studentList)
            // DetailScreen()
    );
  }
}
