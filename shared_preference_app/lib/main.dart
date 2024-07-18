import 'package:flutter/material.dart';
import 'package:shared_preference_app/memo_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // SharedPrefences 공유 환경설정에 데이터 저장 예제
  runApp(const MyApp());
  // 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: 
          // const MyHomePage(title: 'Flutter Demo Home Page'),
          MemoApp()          
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    // 공유 환경설정에 저장해놓은 데이터 가져오기
    _getData();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      // + 버튼 클릭 시, 변경된 counter 값 저장
      _setData(_counter);
    });
  }

  // SharedPrefeces 데이터 저장하는 함수
  void _setData(int value) async {
    var key = 'count';
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }

  // SharedPrefeces 데이터 가져오는 함수
  void _getData() async {
    var key = 'count';
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      var value = pref.getInt(key);
      _counter = value ?? 0;
    });
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}