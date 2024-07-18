import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_app/models/board.dart';
import 'package:http/http.dart' as http;

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {

  late Board _board;

  @override
  void initState() {
    super.initState();
    // 데이터 전달받기
    int? no = ModalRoute.of(context)!.settings.arguments as int?;
    getBoard(no).then((result) {
      setState(() {
        _board = result;
      });
    });
  }


  Future<Board> getBoard(int? no) async {
    var url = "http://10.0.2.2:8080/board/$no";

    var board;
    try {
      var response = await http.get(Uri.parse(url));
      print("::::: response - body :::::");
      print("response.body");
      // UTF-8 디코딩
      var utf8Decoded = utf8.decode( response.bodyBytes );
      // JSON 디코딩
      board = jsonDecode(utf8Decoded);
      print(board);
    } catch (e) {
      print(e);
    }

    return board;

  }


  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text("게시글 조회"),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return {"수정하기", "삭제하기"}.map((String menu) {
                return PopupMenuItem<String>(
                  child: Text(menu),
                  value: menu,
                );
              }).toList();
            },
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
        child: Text(""),
      ),
    );
  }
}