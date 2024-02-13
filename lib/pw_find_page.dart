import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/pw_change_page.dart';
import 'package:pocketbase/pocketbase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PwFindPage(),
    );
  }
}

class PwFindPage extends StatefulWidget {
  const PwFindPage({super.key});

  @override
  State<PwFindPage> createState() => _PwFindPageState();
}

class _PwFindPageState extends State<PwFindPage> {
  final pb = PocketBase('http://3.36.50.35:8090');
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  suffixIcon: Container(
                    width: 64,
                    height: 32,
                    margin: EdgeInsets.only(top: 6, bottom: 6, right: 4),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                    decoration: ShapeDecoration(
                      color: Color(0xFF0059FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        String email = emailController.text;
                        try {
                          print('${emailController.text}');
                          await pb
                              .collection('users')
                              .requestPasswordReset(email);
                        } catch (e) {
                          print('Error sending verification request: $e');
                        }
                      },
                      child: Center(
                        child: Text(
                          '인증요청',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: '인증번호 입력',
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
                height: 5,
              ),
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  '5 : 00',
                  style: TextStyle(
                    color: Color(0xFF7F7F7F),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 268,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PwChangePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0059FF),
                    foregroundColor: Color(0xFF0059FF),
                    fixedSize: Size(300, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
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
              SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
