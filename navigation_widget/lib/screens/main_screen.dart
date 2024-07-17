import 'package:flutter/material.dart';
import 'package:navigation_widget/models/user.dart';
import 'package:navigation_widget/screens/community/community_screen.dart';
import 'package:navigation_widget/screens/home_screen.dart';
import 'package:navigation_widget/screens/user/user_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  // 선택된 화면
  Widget _selectedScreen = HomeScreen();

  // 선택된 화면 index
  int _selectIndex = 0;

  // bottomNavigation 탭 - 콜백함수
  void _onTab(int index) {
    print("화면을 이동합니다...");

    setState(() {
      _selectIndex = index;
      if( _selectIndex == 0 ) _selectedScreen = HomeScreen();
      else if( _selectIndex == 1 ) _selectedScreen = UserScreen(user: User(id: 'joeun', name: '김조은', ),);
      else if( _selectIndex == 2 ) _selectedScreen = CommunityScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("메인 화면"),),
      body: _selectedScreen,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "User",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Community",
          ),
        ],
        currentIndex: _selectIndex,
        onTap: _onTab,
      ),

    );
  }
}