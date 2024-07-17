import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {

  final String data;

  const SecondScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("두 번째 페이지"),),
      body: Center(
        child: Text("두 번째 페이지 : ${data} "),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}