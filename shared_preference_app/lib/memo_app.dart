import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class MemoApp extends StatefulWidget {
  const MemoApp({super.key});

  @override
  State<MemoApp> createState() => _MemoAppState();
}

class _MemoAppState extends State<MemoApp> {

  TextEditingController _controller = TextEditingController();
  List<String> itemList = [];

  @override
  void initState() {
   super.initState();
   initData(); 
  }

  void initData() async {
    List<String> savedItemList = await readListFile();
    setState(() {
      itemList = savedItemList;
    });
  }

  // 🌞 함수 정의
  // 1. 파일 데이터 불러오는 함수
  // 2. 파일 데이터 저장하는 함수
  // 3. 파일 데이터 갱신하는 함수

  // 🌞 파일 데이터 불러오는 함수
  Future<List<String>> readListFile() async {
    List<String> itemList = [];

    // 최초 파일 생성
    // - 처음 파일 생성 시, SharedPreferences 로
    //   'first' 라는 데이터를 확인
    var key = 'first';
    SharedPreferences pref = await SharedPreferences.getInstance();
    var firstCheck = pref.getBool(key);
    // ✅ path_provider 패키지 필요 
    // getApplicationDocumentDirectory() : 앱 경로를 가져오는 함수
    var dir = await getApplicationDocumentsDirectory();
    var file;
    bool fileExist = await File(dir.path + '/test.txt').exists();

    // 최초인 경우
    // firstCheck : null or false
    if( firstCheck == null || firstCheck == false || fileExist == false ) {
      pref.setBool(key, true);    // 최초 파일 생성 여부 : true

      // 최초 파일 생성
      // 1. 프로젝트 안에 파일 가져오기       - (repo/test.txt)
      file = await DefaultAssetBundle.of(context).loadString("repo/test.txt");
      // 2. 가져온 파일을 스마트폰에 저장하기  - (📱/test.txt)
      File(dir.path + "/test.txt").writeAsStringSync(file);
    }
    else {
      // 생성되어 있는 파일 읽기
      file = await File(dir.path + "/test.txt").readAsString();
    }
    
    // test.txt 파일을 state 로 변환
    var array = file.split("\n");   // \n (엔터) 엔터기준으로 구분
    for(var item in array) {
      itemList.add(item);
    }
    return itemList;

  }

  // 🌞 파일 데이터 저장하는 함수
  void writeListFile(String data) async {
    // 파일 가져오기
    var dir = await getApplicationDocumentsDirectory();
    var file = await File(dir.path + "/test.txt").readAsString();
    // 기존 파일에 새 데이터 추가
    file = file + '\n' + data;
    // 파일 저장
    File(dir.path + "/test.txt").writeAsStringSync(file);
  }

  // 🌞 파일 데이터를 갱신(삭제)하는 함수
  Future<bool> deleteListFile(int index) async {
    // itemList 에서 index 의 데이터를 삭제
    List<String> copyList = [];
    copyList.addAll(itemList);
    copyList.removeAt(index);

    // copyList 의 데이터들을 "\n" 으로 구분하여 문자열로 변환
    var fileData = "";
    for(var item in copyList) {
      fileData += item + "\n";
    }
    // 파일 저장
    try {
      var dir = await getApplicationDocumentsDirectory();
      File(dir.path + "/test.txt").writeAsStringSync(fileData);
    } catch(e) {
      print(e);
      return false;
    }
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Memo App"),),
      body: Container(
        child: Center(
          child: Column(
            children: [
              // 입력
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.text,
                  onSubmitted: (data) {
                    print(data);
                  },
                ),
              ),

              const SizedBox(height: 10.0,),

              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return 
                      GestureDetector(
                        onLongPress: () async {
                          print("카드 길게 누름");
                          bool check = await deleteListFile(index);
                          if( check ) {
                            setState(() {
                              itemList.removeAt(index);
                            });
                          }
                        },
                        child: Card(
                          child: Center(
                            child: Text(
                              itemList[index],
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ),
                      );
                  },
                  itemCount: itemList.length,
                )

              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("메모 등록");
          // 입력한 파일 데이터 저장
          writeListFile(_controller.text);
          // 입력한 내용 itemList(🧊) state 에 추가
          setState(() {
            itemList.add(_controller.text);
          });
          // 입력 내용 비우기
          _controller.text = "";
        },
        child: Icon(Icons.create),
      ),
    );
  }
}