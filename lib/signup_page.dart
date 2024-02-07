import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:team_7_sfacpolio/login_page.dart';
import 'package:team_7_sfacpolio/privacy_policy_page.dart';
import 'package:team_7_sfacpolio/profile_setup_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final pb = PocketBase('http://3.36.50.35:8090');
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController PasswordconfirmController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  //final TextEditingController phoneController = TextEditingController();
  final TextEditingController verificationCodeController =
      TextEditingController();
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isPasswordConfirmValid = true;
  bool isVerificationCodeValid = true;

  bool emailSent = false; // 이메일이 보내졌는지 여부 확인
  bool emailVerified = false; // 이메일이 인증되었는지 여부 확인

  bool checked1 = false;
  bool checked2 = false;
  bool checked3 = false;
  bool checked4 = false;
  bool checked5 = false;
  bool obscureText1 = true;
  bool obscureText2 = true;

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode passwordConfirmFocusNode = FocusNode();
  RecordModel record = RecordModel();
  String randomNum = '';

  @override
  void initState() {
    super.initState();

    emailFocusNode.addListener(() {
      if (!emailFocusNode.hasFocus) {
        setState(() {
          isEmailValid = _isEmailValid(emailController.text);
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
    passwordConfirmFocusNode.addListener(() {
      if (!passwordConfirmFocusNode.hasFocus) {
        setState(() {
          isPasswordConfirmValid =
              PasswordconfirmController.text == passwordController.text;
        });
      }
    });
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    passwordConfirmFocusNode.dispose();
    super.dispose();
  }

  Future<void> handleSendEmail() async {
    try {
      Random random = Random();
      for (int i = 0; i < 10; i++) {
        randomNum += random.nextInt(10).toString();
      }
      final body = <String, dynamic>{
        "email": emailController.text,
        "password": randomNum,
        "passwordConfirm": randomNum,
        "verified": false,
      };

      record = (await pb.collection('users').create(body: body));

      print("email : ${emailController.text}");
      print("password : ${record}");

      await pb.collection('users').requestVerification(
            '${emailController.text}',
          );
      print("이메일 잘 보내짐");
    } catch (e) {
      print('이메일 전송 오류: $e');
    }
  }

  Future<void> handleEmailVerification() async {
    try {
      // 인증번호 확인
      await pb.collection('users').confirmVerification(
            verificationCodeController.text,
          );
      setState(() {
        emailVerified = true;
      });
      print('이메일 인증이 성공했습니다!');
    } catch (e) {
      print('이메일 인증 중 오류 발생: $e');
    }
  }

  Future<void> handleEmailDelete() async {
    try {
      // 인증번호 확인
      print(record);
      await pb.collection('users').delete(record.id);
      print('뒤로가기가 성공했습니다!');
    } catch (e) {
      print('뒤로가기 오류 발생: $e');
    }
  }

  // Function to handle the sign-up button press
  Future<void> handleSignUp() async {
    try {
      // Check if password and confirm password match
      if (passwordController.text != PasswordconfirmController.text) {
        // Passwords do not match
        print('Passwords do not match.');
        return;
      }
      final updaterecord = await pb.collection('users').getOne(
            record.id,
          );
      print(updaterecord.data['verified']);

      if (updaterecord.data['verified'] == false) {
        print('verified가 false임');
        return;
      }

      final body = <String, dynamic>{
        "name": nameController.text,
        "password": passwordController.text,
        "passwordConfirm": PasswordconfirmController.text,
        "oldPassword": 1234567891,
      };

      print("record: ${updaterecord}");
      print(body);
      final updateRecord =
          await pb.collection('users').update(record.id, body: body);
      print('Sign-up successful!');
      print('User ID: ${updateRecord}');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileSetupPage(
            userId: updateRecord.id,
            name: nameController.text,
          ),
        ),
      );
    } catch (e) {
      print('Error during sign-up: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        clipBehavior: Clip.antiAlias,
        backgroundColor: Color(0xFFF8F8F9),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  handleEmailDelete();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 100,
              ),
              Text(
                '회원가입',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 24,
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
                controller: nameController,
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
              Container(
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
                  onTap: () {
                    setState(() {
                      if (!isEmailValid) {
                        isEmailValid = true;
                      }
                    });
                  },
                  controller: emailController,
                  focusNode: emailFocusNode,
                  enableInteractiveSelection: false,
                  style: TextStyle(
                    color: isEmailValid ? Color(0xFF020202) : Colors.red,
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9, vertical: 4),
                      decoration: ShapeDecoration(
                        color: Color(0xFF0059FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          print("되냐");
                          handleSendEmail();
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
              ),
              SizedBox(
                height: 6,
              ),
              TextField(
                controller: verificationCodeController,
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
                onTap: () {
                  setState(() {
                    if (!isVerificationCodeValid) {
                      isVerificationCodeValid = true;
                    }
                  });
                },
              ),
              SizedBox(
                height: 8,
              ),
              if (!isEmailValid)
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '잘못된 이메일 형식입니다. 다시 입력해주세요.',
                    style: TextStyle(
                      color: Color(0xFFFF0000),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              if (!isVerificationCodeValid)
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '잘못된 인증번호입니다. 다시 인증해주세요.',
                    style: TextStyle(
                      color: Color(0xFFFF0000),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              SizedBox(
                height: 25,
              ),
              Text(
                '비밀번호',
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
              Container(
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
                  obscureText: obscureText1,
                  focusNode: passwordFocusNode,
                  enableInteractiveSelection: false,
                  style: TextStyle(
                    color: isPasswordValid ? Color(0xFF020202) : Colors.red,
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                  onTap: () {
                    setState(() {
                      if (!isPasswordValid) {
                        isPasswordValid = true;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    hintText: '비밀번호를 입력해주세요',
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
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText1 = !obscureText1;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          obscureText1
                              ? "assets/icons/eye.svg"
                              : "assets/icons/eye-off.svg",
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              if (isPasswordValid)
                Text(
                  "(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~6자)",
                  style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              if (!isPasswordValid)
                Container(
                  padding: EdgeInsets.only(top: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '조건에 맞지 않는 비밀번호입니다. 다시 입력해주세요.',
                    style: TextStyle(
                      color: Color(0xFFFF0000),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              SizedBox(
                height: 12,
              ),
              Text(
                '비밀번호 확인',
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
              Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: isPasswordConfirmValid
                        ? BorderSide.none
                        : BorderSide(color: Colors.red, width: 1),
                  ),
                ),
                child: TextField(
                  controller: PasswordconfirmController,
                  focusNode: passwordConfirmFocusNode,
                  enableInteractiveSelection: false,
                  obscureText: obscureText2,
                  onTap: () {
                    setState(() {
                      if (!isPasswordConfirmValid) {
                        isPasswordConfirmValid = true;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    hintText: '비밀번호를 한번 더 입력해주세요.',
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
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText2 = !obscureText2;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          obscureText2
                              ? "assets/icons/eye.svg"
                              : "assets/icons/eye-off.svg",
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (!isPasswordConfirmValid)
                Container(
                  padding: EdgeInsets.only(top: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '조건에 맞지 않는 비밀번호입니다. 다시 입력해주세요.',
                    style: TextStyle(
                      color: Color(0xFFFF0000),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            checked1 = !checked1;
                            checked2 = !checked2;
                            checked3 = !checked3;
                            checked4 = !checked4;
                            checked5 = !checked5;
                          });
                        },
                        child: checked1
                            ? SvgPicture.asset(
                                'assets/icons/check-circle-checked.svg',
                                width: 24,
                                height: 24,
                              )
                            : SvgPicture.asset(
                                'assets/icons/check-circle.svg',
                                width: 24,
                                height: 24,
                                color: Color(0xFFE6E6E6),
                              ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '약관 전체동의합니다.',
                        style: TextStyle(
                          color: Color(0xFF020202),
                          fontSize: 13,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyPolicyPage(),
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/icons/chevron-right.svg', // SVG 파일의 경로
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                width: 360,
                height: 1,
                decoration: BoxDecoration(color: Color(0xFFE6E6E6)),
              ),
              // CupertinoTextField(
              //   controller: phoneController,
              //   placeholder: 'sfaclog@gmail.com',
              //   keyboardType: TextInputType.phone,
              // ),

              SizedBox(height: 16.0),
              Row(
                children: [
                  buildCheckbox('개인정보 수집 이용 동의', checked2),
                  Text(
                    "개인정보 수집 이용 동의",
                    style: TextStyle(
                      color: Color(0xFF020202),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    '(필수)',
                    style: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  buildCheckbox('고유식별 정보처리 동의', checked3),
                  Text(
                    "고유식별 정보처리 동의",
                    style: TextStyle(
                      color: Color(0xFF020202),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    '(필수)',
                    style: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  buildCheckbox('통신사 이용약관 동의', checked4),
                  Text(
                    "통신사 이용약관 동의",
                    style: TextStyle(
                      color: Color(0xFF020202),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    '(필수)',
                    style: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  buildCheckbox('서비스 이용약관 동의', checked5),
                  Text(
                    "서비스 이용약관 동의",
                    style: TextStyle(
                      color: Color(0xFF020202),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    '(필수)',
                    style: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (checked1) {
                    setState(() {
                      // 즉시 업데이트
                      handleSignUp();
                    });

                    // 약간의 딜레이를 주고 나서 다시 업데이트
                    await Future.delayed(Duration(milliseconds: 0));
                    setState(() {});
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      checked1 ? Color(0xFF0059FF) : Color(0xFFE6E6E6),
                  foregroundColor:
                      checked1 ? Color(0xFF0059FF) : Color(0xFFE6E6E6),
                  fixedSize: Size(300, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Container(
                  child: Center(
                    child: Text(
                      '다음',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: checked1 ? Colors.white : Color(0xFF999999),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 67,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCheckbox(String text, bool isChecked) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (text == '개인정보 수집 이용 동의') {
                  checked2 = !checked2;
                } else if (text == '고유식별 정보처리 동의') {
                  checked3 = !checked3;
                } else if (text == '통신사 이용약관 동의') {
                  checked4 = !checked4;
                } else if (text == '서비스 이용약관 동의') {
                  checked5 = !checked5;
                }

                // 모든 체크박스가 체크되었는지 확인
                checked1 = checked2 && checked3 && checked4 && checked5;

                print('checked1: $checked1');
                print('checked2: $checked2');
                print('checked3: $checked3');
                print('checked4: $checked4');
                print('checked5: $checked5');
              });
            },
            child: isChecked
                ? SvgPicture.asset(
                    'assets/icons/check-circle-checked.svg',
                    width: 24,
                    height: 24,
                  )
                : SvgPicture.asset(
                    'assets/icons/check-circle.svg',
                    width: 24,
                    height: 24,
                    color: Color(0xFFE6E6E6),
                  ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  bool _isEmailValid(String email) {
    // 간단한 이메일 형식 유효성 검사 정규 표현식
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }
}
