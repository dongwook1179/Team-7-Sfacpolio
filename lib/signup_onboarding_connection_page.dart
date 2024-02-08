import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/home_page.dart';
import 'package:team_7_sfacpolio/screen/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupOnboardingConnectionPage(),
    );
  }
}

class SignupOnboardingConnectionPage extends StatelessWidget {
  const SignupOnboardingConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 360,
        height: 740,
        decoration: BoxDecoration(color: Color(0xFFF8F8F9)),
        child: Column(
          children: [
            SizedBox(
              height: 146,
            ),
            SvgPicture.asset(
              'assets/icons/spac_logo.svg',
              height: 77.08,
              width: 68.74,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              '가입을 환영해요!',
              style: TextStyle(
                color: Color(0xFF020202),
                fontSize: 18,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              width: 251,
              child: Text(
                '스펙 로그는 개인 성향에 따라 \n맞춤 자료를 추천해드리고 있습니다.\n보다 나은 서비스를 위해\n 몇가지 질문을 해도 될까요?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 154,
            ),
            Text(
              '설정된 사항은 [마이페이지>개인성향]에서 변경 할 수 있어요 ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF4C4C4C),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Onboarding(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  backgroundColor: Color(0xFF0059FF),
                  foregroundColor: Color(0xFF0059FF),
                  fixedSize: Size(300, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Container(
                  child: Center(
                    child: Text(
                      '시작하기',
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
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  fixedSize: Size(300, 50),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF0059FF)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    '다음에 설정할래요',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF0059FF),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
