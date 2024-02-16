import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/login_page.dart';
import 'package:team_7_sfacpolio/pw_change_page.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:team_7_sfacpolio/pw_dialog_widget.dart';

class PwFindPage extends StatefulWidget {
  const PwFindPage({super.key});

  @override
  State<PwFindPage> createState() => _PwFindPageState();
}

class _PwFindPageState extends State<PwFindPage> {
  final pb =
      PocketBase('https://iooykz0o87.execute-api.ap-northeast-2.amazonaws.com');
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFF8F8F9),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 79,
                ),
                Text(
                  '비밀번호 찾기',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "이름",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '이름',
                    hintStyle: TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 12, top: 14, bottom: 10),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  "이메일",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'sfaclog@gmail.com',
                    hintStyle: TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 12, top: 14, bottom: 10),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 350,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () async {
                      String email = emailController.text;
                      try {
                        print('${emailController.text}');
                        await pb
                            .collection('users')
                            .requestPasswordReset(email);
                        await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                body: PwDialogWidget(),
                                backgroundColor:
                                    Color(0xffffffff).withOpacity(0),
                              );
                            });
                      } catch (e) {
                        print('Error sending verification request: $e');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0059FF),
                      foregroundColor: Color(0xFF0059FF),
                      fixedSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Center(
                      child: Center(
                        child: Text(
                          '다음',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
