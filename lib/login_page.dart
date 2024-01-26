import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:team_7_sfacpolio/pw_find_page.dart';
import 'package:team_7_sfacpolio/signup_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final pb = PocketBase('http://3.36.50.35:8090');
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool checkboxvalue = false;
  bool isLoginValid = true;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  Future<void> handleLogin() async {
    try {
      if (pb.authStore.isValid) {
        final authData = await pb.collection('users').authWithPassword(
              idController.text,
              passwordController.text,
            );

        print('로그인 성공!');
        print('토큰: ${pb.authStore.token}');
        print('사용자 ID: ${pb.authStore.model.id}');
      } else {
        print('로그인 실패.');
        setState(() {
          isEmailValid = false;
          isPasswordValid = false;
          isLoginValid = false;
        });

        print('${isLoginValid}');
      }
    } catch (e) {
      print('로그인 중 오류 발생: $e');
      setState(() {
        isEmailValid = false;
        isPasswordValid = false;
        isLoginValid = false;
      });
    }
    // pb.authStore.clear();
  }

  @override
  void initState() {
    super.initState();

    emailFocusNode.addListener(() {
      if (!emailFocusNode.hasFocus) {
        setState(() {
          isEmailValid = _isEmailValid(idController.text);
        });
      }
    });

    passwordFocusNode.addListener(() {
      if (!passwordFocusNode.hasFocus) {
        setState(() {
          isPasswordValid = passwordController.text.isNotEmpty;
        });
      }
    });
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoDynamicColor.withBrightness(
          color: Color(0xFFF8F8F9), darkColor: CupertinoColors.black),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 96,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/icons/spac_logo.svg',
                height: 73,
                width: 64,
              ),
            ),
            SizedBox(
              height: 56,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "이메일",
                style: TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: CupertinoTextField(
                padding: EdgeInsets.only(top: 14, bottom: 14, left: 12),
                controller: idController,
                focusNode: emailFocusNode,
                placeholder: 'sfaclog@gmail.com',
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: isEmailValid ? Colors.transparent : Colors.red,
                    width: 1.0,
                  ),
                ),
                onTap: () {
                  setState(() {
                    isEmailValid = true;
                    if (!isLoginValid) {
                      isLoginValid = true;
                      isPasswordValid = true;
                    }
                  });
                },
                onChanged: (value) {},
              ),
            ),
            if (!isEmailValid && isPasswordValid)
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 5),
                child: Text(
                  '이메일 주소를 입력해주세요',
                  style: TextStyle(
                    color: Color(0xFFFF0000),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            SizedBox(height: 12.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "비밀번호",
                style: TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 6.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: CupertinoTextField(
                padding: EdgeInsets.only(top: 14, bottom: 14, left: 12),
                controller: passwordController,
                focusNode: passwordFocusNode,
                placeholder: '123Ab*',
                obscureText: true,
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: isPasswordValid ? Colors.transparent : Colors.red,
                    width: 1.0,
                  ),
                ),
                onTap: () {
                  setState(() {
                    isPasswordValid = true;
                    if (!isLoginValid) {
                      isLoginValid = true;
                      isEmailValid = true;
                    }
                  });
                },
              ),
            ),
            if (isPasswordValid)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~6자)",
                  style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            if (!isPasswordValid && isEmailValid)
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 5),
                child: Text(
                  '비밀번호를 입력해주세요.',
                  style: TextStyle(
                    color: Color(0xFFFF0000),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            if (!isLoginValid)
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 5),
                child: Text(
                  '잘못 입력된 이메일 또는 비밀번호입니다. 다시 입력해주세요.',
                  style: TextStyle(
                    color: Color(0xFFFF0000),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            SizedBox(height: 22.0),
            Container(
              margin: const EdgeInsets.only(left: 32),
              child: Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: ShapeDecoration(
                      color: Color(0x00D9D9D9),
                      shape: RoundedRectangleBorder(side: BorderSide(width: 1)),
                    ),
                    child: Transform.scale(
                      scale: 0.85,
                      child: CupertinoCheckbox(
                        shape: RoundedRectangleBorder(side: BorderSide.none),
                        value: checkboxvalue,
                        onChanged: (value) {
                          setState(() {
                            checkboxvalue = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    '자동로그인',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: 300,
                height: 50,
                decoration: ShapeDecoration(
                  color: Color(0xFF0059FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: CupertinoButton(
                  onPressed: () {
                    handleLogin();
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        '로그인',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 29, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 17,
                            ),
                            Row(
                              children: [
                                Text(
                                  "아직 회원이 아니신가요? ",
                                  style: TextStyle(
                                    color: Color(0xFF747474),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => SignUpPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    '회원가입',
                                    style: TextStyle(
                                      color: Color(0xFF0059FF),
                                      fontSize: 12,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => PwFindPage(),
                            ),
                          );
                        },
                        child: Text(
                          '비밀번호 찾기',
                          style: TextStyle(
                            color: Color(0xFF747474),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Container(
              margin: EdgeInsets.only(left: 27, right: 41),
              child: Row(
                children: [
                  Container(
                    width: 95.00526,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.50,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF818181),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '소셜계정 로그인',
                    style: TextStyle(
                      color: Color(0xFF747474),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 14.99,
                  ),
                  Container(
                    width: 95.00526,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.50,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF818181),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              margin: EdgeInsets.only(left: 38, right: 47),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(12, 10, 12, 10.33),
                    width: 50,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: Color(0xFF080808),
                      shape: OvalBorder(),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/apple_logo.svg',
                      height: 29.67327,
                      width: 25,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(13, 14, 12, 11),
                    width: 50,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFEE500),
                      shape: OvalBorder(),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/kakao_logo.svg',
                      height: 25.0001,
                      width: 25,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    width: 50,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: Color(0xFF03C75A),
                      shape: OvalBorder(),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/naver_logo.svg',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      'assets/icons/google_logo.png',
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _isEmailValid(String email) {
    // 간단한 이메일 형식 유효성 검사 정규 표현식
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }
}
