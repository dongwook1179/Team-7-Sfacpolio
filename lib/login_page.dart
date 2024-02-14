import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/home_page.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
// import 'package:team_7_sfacpolio/provider/navigation_provider.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/pw_find_page.dart';
import 'package:team_7_sfacpolio/signup_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

// void main() {
//   runApp(
//     LoginPage(),
//   );
// }

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => NavigationProvider(),
//       child: MaterialApp(
//         home: ChangeNotifierProvider(
//           create: (context) => User_Data(),
//           child: _LoginPage(),

//         ),
//       ),
//     );
//   }
// }

// class _LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

// class _LoginPageState extends State<_LoginPage> {
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
      final authData = await pb.collection('users').authWithPassword(
            idController.text,
            passwordController.text,
          );
      print('로그인 성공!');
      print('토큰111: ${pb.authStore}');
      print('토큰: ${pb.authStore.token}');
      print('사용자 ID: ${pb.authStore.model.id}');
      Map<String, dynamic> user_data =
          await PocketBaseData().Get_UserData(authData.record!.id);

      Provider.of<User_Data>(context, listen: false)
          .Save_Auth(authData, pb.authStore, user_data);
      print('저장확인1');
      print(context.read<User_Data>().record);
      print('저장확인2');
      print(context.read<User_Data>().auth);
      print('저장확인3');
      print(context.read<User_Data>().user_data);
      print('이동');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } catch (e) {
      print('로그인 실패: $e');
      setState(() {
        isEmailValid = false;
        isPasswordValid = false;
        isLoginValid = false;
      });
    }
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
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F9),
      body: SizedBox(
        width: 360,
        height: 740,
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
                    color: Colors.black,
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
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: isEmailValid
                        ? BorderSide.none
                        : BorderSide(color: Colors.red, width: 1),
                  ),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: idController,
                  focusNode: emailFocusNode,
                  enableInteractiveSelection: false,
                  cursorColor: Color(0xFF0059FF),
                  decoration: InputDecoration(
                    hintText: 'sfaclog@gmail.com',
                    hintStyle: TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                      // borderSide: isEmailValid
                      //     ? BorderSide.none
                      //     : BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      print("a : ${isEmailValid}");
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
                Container(
                  margin: const EdgeInsets.only(right: 30, top: 5),
                  alignment: Alignment.centerRight,
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
                    color: Colors.black,
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
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: isPasswordValid
                          ? BorderSide.none
                          : BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                  child: TextField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    enableInteractiveSelection: false,
                    cursorColor: Color(0xFF0059FF),
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '123Ab*',
                      hintStyle: TextStyle(
                        color: Color(0xFFB3B3B3),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
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
                  )),
              if (isPasswordValid)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)",
                    style: TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 11,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              if (!isPasswordValid && isEmailValid)
                Container(
                  margin: const EdgeInsets.only(right: 30, top: 5),
                  alignment: Alignment.centerRight,
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
                        shape:
                            RoundedRectangleBorder(side: BorderSide(width: 1)),
                      ),
                      child: Transform.scale(
                        scale: 0.85,
                        child: Checkbox(
                          shape: RoundedRectangleBorder(side: BorderSide.none),
                          activeColor: Color(0xFF0059FF),
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
                height: 32,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () {
                    handleLogin();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0059FF),
                    foregroundColor: Color(0xFF0059FF),
                    fixedSize: Size(300, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Container(
                    child: Center(
                      child: Text(
                        '로그인',
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
                                        MaterialPageRoute(
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
                                        decorationColor: Color(0xFF196AFF),
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
                              MaterialPageRoute(
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
                      width: 9.8,
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
                      width: 9.8,
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
                margin: EdgeInsets.symmetric(horizontal: 81),
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
                      width: 24,
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
                      width: 24,
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
                  ],
                ),
              )
            ],
          ),
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
