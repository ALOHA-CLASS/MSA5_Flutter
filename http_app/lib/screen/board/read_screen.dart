import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_app/models/board.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  late int no;
  late Future<Board> _board;

  final List<PopupMenuEntry<String>> _popupMenuItems = [
    const PopupMenuItem<String>(
      value: 'update',
      child: Row(
        children: [
          Icon(Icons.edit, color: Colors.black), // 아이콘
          SizedBox(width: 8), // 아이콘과 텍스트 사이에 간격 추가
          Text('수정하기'), // 텍스트
        ],
      ),
    ),
    const PopupMenuItem<String>(
      value: 'delete',
      child: Row(
        children: [
          Icon(Icons.delete, color: Colors.black), // 아이콘
          SizedBox(width: 8), // 아이콘과 텍스트 사이에 간격 추가
          Text('삭제하기'), // 텍스트
        ],
      ),
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      no = arguments as int;
      _board = getBoard(no);
    } else {
      // 기본값 설정 또는 예외 처리
      no = 0;
      _board = Future.error('No board number provided');
    }
  }

  ///
  /// 👩‍💻 게시글 조회 요청
  ///
  Future<Board> getBoard(int no) async {
    var url = "http://10.0.2.2:8080/board/$no";
    try {
      var response = await http.get(Uri.parse(url));
      print("::::: response - body :::::");
      print(response.body);
      // UTF-8 디코딩
      var utf8Decoded = utf8.decode(response.bodyBytes);
      // JSON 디코딩
      var boardJson = jsonDecode(utf8Decoded);
      print(boardJson);
      return Board(
        no: boardJson['no'],
        title: boardJson['title'],
        writer: boardJson['writer'],
        content: boardJson['content'],
      );
    } catch (e) {
      print(e);
      throw Exception('Failed to load board');
    }
  }

  /// 게시글 삭제 요청
  Future<bool> deleteBoard(int no) async {
    var url = "http://10.0.2.2:8080/board/$no";
    try {
      var response = await http.delete(Uri.parse(url));
      print("::::: response - statusCode :::::");
      print(response.statusCode);
      
      if (response.statusCode == 200 || response.statusCode == 204) {
        // 성공적으로 삭제됨
        print("게시글 삭제 성공");
        return true;
      } else {
        // 실패 시 오류 메시지
        throw Exception('Failed to delete board. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  ///
  /// ❓ 삭제 확인
  ///
  Future<bool> _showDeleteConfirmDialog() async {
    bool result = false;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('삭제 확인'),
          content: Text('정말로 이 게시글을 삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // 취소를 클릭하면 false 반환
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // 삭제를 클릭하면 true 반환
              },
              child: Text('삭제'),
            ),
          ],
        );
      },
    ).then((value) {
      // 다이얼로그 결과를 result에 저장
      result = value ?? false;
    });
    return result;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("게시글 조회"),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return _popupMenuItems;
            },
            icon: const Icon(Icons.more_vert),
            onSelected: (String value) async {
              if (value == 'update') {
                Navigator.pushReplacementNamed(context, "/board/update", arguments: no,);
              } else if (value == 'delete') {
                bool check = await _showDeleteConfirmDialog();
                if( check ) {
                  deleteBoard(no).then((result) {
                    if( result ) {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, "/board/list");
                    }
                  });
                }

              }
            },
          )
        ],
      ),
      body: FutureBuilder<Board>(
        future: _board,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          } else {
            var board = snapshot.data!;
            return 
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.article),
                      title: Text(board.title ?? '제목'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(board.writer ?? '작성자'),
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      padding: const EdgeInsets.all(12.0),
                      width: double.infinity,
                      height: 320.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3), // 그림자의 색상과 투명도
                            spreadRadius: 2, // 그림자의 확산 정도
                            blurRadius: 8, // 그림자의 흐림 정도
                            offset: const Offset(4, 4), // 그림자의 위치 (x, y)
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8), // 옵션: 모서리 둥글기
                      ),
                      child: SingleChildScrollView(
                              child: Text(board.content ?? '내용')
                            )
                  ),
                ]
              ),
            );
          }
        },
      ),
    );
  }
}
