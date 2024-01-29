import 'package:flutter/material.dart';

class PwFindPage extends StatefulWidget {
  const PwFindPage({super.key});

  @override
  State<PwFindPage> createState() => _PwFindPageState();
}

class _PwFindPageState extends State<PwFindPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          Text("비밀번호 찾기"),
          TextField(
            decoration: InputDecoration(
              labelText: '이름',
              hintText: '이름',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: '이메일',
              hintText: 'sfaclog@gmail.com',
              suffix: ElevatedButton(
                onPressed: () {
                  // 버튼이 클릭되었을 때 수행할 동작
                  print('Button Clicked');
                },
                child: Text('인증요청'),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: '인증번호 입력',
            ),
          ),
        ],
      )),
    );
  }
}
