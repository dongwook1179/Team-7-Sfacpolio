import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/social_signup_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Page_Controller()),
        ChangeNotifierProvider(create: (_) => User_Data()),
      ],
      child: MaterialApp(
        color: Color(0xFFFFFFFF),
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: 360,
          height: 740,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, 1.00),
              end: Alignment(0, -1),
              colors: [
                Color(0xD1BED5FF),
                Color(0xE87CAAFF),
                Color(0xFFC8DBFF),
                Color(0xFFACC9FF)
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 115.46,
              ),
              SvgPicture.asset(
                'assets/icons/spac_logo.svg',
                height: 77.08,
                width: 68.74,
              ),
              SizedBox(
                height: 86.46,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '새로운\n도전을 담은\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontFamily: 'S-Core Dream',
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    TextSpan(
                      text: '스팩 관리',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontFamily: 'S-Core Dream',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 143,
              ),
              SvgPicture.asset(
                'assets/icons/SFAC_LOG.svg',
                height: 22.89939,
                width: 151,
              ),
              SizedBox(
                height: 30.1,
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
            ],
          ),
        ),
      ),
    );
  }
}
