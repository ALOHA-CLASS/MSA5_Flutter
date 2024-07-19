import 'package:flutter/material.dart';
import 'package:http_app/main_screen.dart';
import 'package:http_app/screen/board/insert_screen.dart';
import 'package:http_app/screen/board/list_screen.dart';
import 'package:http_app/screen/board/read_screen.dart';
import 'package:http_app/screen/board/update_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/main',
      routes: {
        '/main' : (context) => const MainScreen(),
        '/board/list' : (context) => const ListScreen(),
        '/board/read' : (context) => const ReadScreen(),
        '/board/insert' : (context) => const InsertScreen(),
        '/board/update' : (context) => const UpdateScreen(),
      },
    );
  }
}
