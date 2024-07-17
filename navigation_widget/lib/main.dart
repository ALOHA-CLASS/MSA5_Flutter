import 'package:flutter/material.dart';
import 'package:navigation_widget/screens/community/community_screen.dart';
import 'package:navigation_widget/screens/first_screen.dart';
import 'package:navigation_widget/screens/home_screen.dart';
import 'package:navigation_widget/screens/main_screen.dart';
import 'package:navigation_widget/screens/user/user_screen.dart';

import 'models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FirstScreen(),
      // initialRoute: '/main',
      // routes: {
      //   '/main' : (context) => MainScreen(),
      //   '/home' : (context) => HomeScreen(),
      //   '/user' : (context) => UserScreen(user: User(id: '', name: ''),),
      //   '/community' : (context) => CommunityScreen(),
      // },
    );
  }
}
