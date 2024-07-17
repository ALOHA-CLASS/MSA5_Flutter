import 'package:flutter/material.dart';
import 'package:layout_widget/models/student.dart';
import 'package:layout_widget/screens/detail_screen.dart';

class ListviewScreen extends StatefulWidget {
  final List<Student> list;
  const ListviewScreen({super.key, required this.list});

  @override
  State<ListviewScreen> createState() => _ListviewScreenState();
}

class _ListviewScreenState extends State<ListviewScreen> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("리스트 뷰"),),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, position) {
              return 
                GestureDetector(
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Image.asset(
                        widget.list[position].imagePath ?? "image/logo.png",
                        width: 64,
                        height: 64,
                        fit: BoxFit.contain,
                      ), 
                      Text( widget.list[position].name ?? "이름없음" ),
                      const Icon(
                        Icons.arrow_right,
                        size: 32.0,
                        color: Colors.black
                      ),
                      ],
                    ),
                  ),
                  onTap: () {
                    print("카드 클릭!!!");
                    AlertDialog dialog = AlertDialog(
                      content: const Text(
                        "제목은 OOO 입니다.",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            print("확인 버튼 클릭!");
                            // alert를 스크린에서 제거
                            Navigator.of(context).pop();

                            // 상세화면으로 이동
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(student: widget.list[position],))
                            );

                          },
                          child: const Text("확인"),
                        )
                      ],
                    );
                    // Dialog 실행
                    // showDialog(
                    //   context: context, 
                    //   builder: (BuildContext context) => dialog
                    // );
                    // 상세화면으로 이동
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(student: widget.list[position],))
                    );
                    
                  },
                  // 길게 눌렀을 때
                  onLongPress: () {
                    print("길게 누름!");

                  },
                  // 더블 탭 했을 때 
                  onDoubleTap: () { 
                    print("더블 탭 누름!");

                  },
                )
              ;
            },
            itemCount: widget.list.length,
          )
          ,
        )
      ),
    );
  }
}