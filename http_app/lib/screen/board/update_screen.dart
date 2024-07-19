import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _writerController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  late int no;

  final List<PopupMenuEntry<String>> _popupMenuItems = [
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
      getBoard(no); // 이름 변경된 메서드 호출
    }
  }

  ///
  /// 👩‍💻 게시글 조회 요청
  ///
  Future<void> getBoard(int no) async {
    var url = "http://10.0.2.2:8080/board/$no";
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var utf8Decoded = utf8.decode(response.bodyBytes);
        var boardJson = jsonDecode(utf8Decoded);

        _titleController.text = boardJson['title'];
        _writerController.text = boardJson['writer'];
        _contentController.text = boardJson['content'];
      } else {
        throw Exception('Failed to load board details');
      }
    } catch (e) {
      print(e);
    }
  }

  /// 게시글 수정 요청
  Future<void> updateBoard() async {
    if (_formKey.currentState!.validate()) {
      var url = "http://10.0.2.2:8080/board";
      try {
        var response = await http.put(
          Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            'no' : no,
            'title': _titleController.text,
            'writer': _writerController.text,
            'content': _contentController.text,
          }),
        );

        if (response.statusCode == 200 || response.statusCode == 204) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('게시글 수정 성공!'),
              backgroundColor: Colors.blueAccent,
            ),
          );
          Navigator.pushReplacementNamed(context, "/board/list");
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('게시글 수정 실패...'),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('에러: $e')),
        );
      }
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
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("게시글 수정"),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return _popupMenuItems;
            },
            icon: const Icon(Icons.more_vert),
            onSelected: (String value) async {
              if (value == 'delete') {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: '제목'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '제목을 입력하세요';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _writerController,
                decoration: const InputDecoration(labelText: '작성자'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '작성자를 입력하세요';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: '내용'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '내용을 입력하세요';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 60,
        color: Colors.white,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              updateBoard();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50), // 가로 100% 버튼
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // 테두리를 둥글지 않게 설정
              ),
            ),
            child: const Text('수정하기'),
          ),
        ),
      ),
    );
  }

  /// 삭제 확인 다이얼로그 표시 메서드
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
      result = value ?? false;
    });
    return result;
  }

  
}
