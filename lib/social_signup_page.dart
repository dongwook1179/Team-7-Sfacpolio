import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/login_page.dart';

class SocialSignPage extends StatelessWidget {
  const SocialSignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF8F8F9),
        body: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(
                height: 168,
              ),
              SvgPicture.asset(
                'assets/icons/spac_logo.svg',
                height: 73,
                width: 64,
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                '지금 가입하고,\n다양한 도전의 기회를 놓치지마세요',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 15,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SocialSignPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                        left: 16, top: 11, bottom: 14.5, right: 90),
                    backgroundColor: Color(0xFF0059FF),
                    foregroundColor: Color(0xFF0059FF),
                    fixedSize: Size(300, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/mail.svg",
                          color: Colors.white,
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(
                          width: 59,
                        ),
                        Center(
                          child: Text(
                            '이메일로 계속하기',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SocialSignPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                        left: 16, top: 11, bottom: 14.5, right: 90),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    fixedSize: Size(300, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.black, width: 0.5)),
                  ),
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/apple_logo.svg',
                          width: 24,
                          height: 24,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 58,
                        ),
                        Center(
                          child: Text(
                            'Apple로 계속하기',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SocialSignPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 16, top: 11, bottom: 14.5),
                    backgroundColor: Color(0xFFFEE500),
                    foregroundColor: Color(0xFFFEE500),
                    fixedSize: Size(300, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/kakao_logo.svg',
                          height: 24,
                          width: 24,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 51,
                        ),
                        Center(
                          child: Text(
                            '카카오톡으로 계속하기',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SocialSignPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                        left: 16, top: 11, bottom: 14.5, right: 90),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    fixedSize: Size(300, 50),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF0059FF)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/google_logo.svg',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(
                        width: 54, // 아이콘과 텍스트 사이의 간격 조절
                      ),
                      Center(
                        child: Text(
                          'Google로 계속하기',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF0059FF),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "이미 계정이 있으신가요? ",
                    style: TextStyle(
                      color: Color(0xFF7F7F7F),
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
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "로그인",
                      style: TextStyle(
                        color: Color(0xFF196AFF),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF196AFF),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
