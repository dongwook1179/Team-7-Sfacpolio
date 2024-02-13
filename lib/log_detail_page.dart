import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/widgets/comment/comment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogDetailPage(),
    );
  }
}

class LogDetailPage extends StatefulWidget {
  const LogDetailPage({super.key});

  @override
  State<LogDetailPage> createState() => _LogDetailPageState();
}

class _LogDetailPageState extends State<LogDetailPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 48,
          leading: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.chevron_left,
                size: 16,
              )),
          centerTitle: true,
          title: Text(
            'LOG 보기',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF020202),
              fontSize: 16,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: ShapeDecoration(
                                color: Colors.grey,
                                shape: OvalBorder(),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              'qwerd4578',
                              style: TextStyle(
                                color: Color(0xFF4C4C4C),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              '백엔드',
                              style: TextStyle(
                                color: Color(0xFFB3B3B3),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.favorite_outline,
                            size: 24,
                            color: Color(0xFF999999),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '개발자가 되기 위한 5일의 기록',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 326,
                      height: 246,
                      decoration: ShapeDecoration(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '<2024년 1월 15일>\n',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text:
                                '오늘은 새로운 프로젝트의 백엔드 개발을 시작했다. 초기 설정으로 Git을 이용해 레포지토리를 만들고, Flask를 사용하여 간단한 API를 구축했다.\n',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: '<2024년 1월 16일>\n',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text:
                                '데이터베이스 설계를 마치고 PostgreSQL을 선택했다. SQLAlchemy를 활용하여 모델을 정의하고 데이터베이스와의 연동을 구현했다.\n',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: '<2024년 1월 17일>\n',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text:
                                '사용자 인증 시스템을 개발 중. Flask-Login을 도입하여 로그인과 로그아웃을 처리하는 기능을 구현했다.\n',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: '<2024년 1월 18일>\n',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text:
                                'API 엔드포인트에 대한 유닛 테스트를 작성했다. pytest를 이용하여 각 함수의 정상 작동 및 예외 상황에 대한 테스트를 수행했다.\n',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: '<2024년 1월 19일>\n',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text:
                                '보안 강화를 위해 JWT(Json Web Token)를 도입하여 토큰 기반의 인증 시스템을 구현했다. 사용자의 권한을 관리하는 데 큰 도움이 될 것으로 예상된다.',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/heart.svg",
                              color: Color(0xFF7F7F7F),
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              '999+',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFF7F7F7F),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              "assets/icons/chat-alt.svg",
                              color: Color(0xFF7F7F7F),
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              '220',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFF7F7F7F),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              "assets/icons/eye.svg",
                              color: Color(0xFF7F7F7F),
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              '2.7k',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFF7F7F7F),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '2024.01.21',
                          style: TextStyle(
                            color: Color(0xFFB3B3B3),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 328,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFB3B3B3),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '댓글 220',
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          '인기순',
                          style: TextStyle(
                            color: Color(0xFF020202),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '최신순',
                          style: TextStyle(
                            color: Color(0xFFB3B3B3),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Comment(),
                    SizedBox(
                      height: 20,
                    ),
                    Comment(),
                    SizedBox(
                      height: 20,
                    ),
                    Comment(),
                    SizedBox(
                      height: 20,
                    ),
                    Comment(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '다음 댓글 더보기...',
                      style: TextStyle(
                        color: Color(0xFF7F7F7F),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 360,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFFF8F8F9),
                  border: Border(
                    left: BorderSide(color: Color(0xFFF3F3F3)),
                    top: BorderSide(width: 1, color: Color(0xFFF3F3F3)),
                    right: BorderSide(color: Color(0xFFF3F3F3)),
                    bottom: BorderSide(color: Color(0xFFF3F3F3)),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Container(
                  width: 328,
                  height: 40,
                  padding: const EdgeInsets.only(
                      top: 4, left: 8, right: 6, bottom: 4),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '댓글을 입력해주세요.',
                      hintStyle: TextStyle(
                        color: Color(0xFFB3B3B3),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.only(top: 9.5, bottom: 9.5),
                      suffixIcon: SvgPicture.asset(
                        "assets/icons/arrow-circle-up.svg",
                        width: 32,
                        height: 32,
                        color: Color(0xFFB3B3B3),
                      ),
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
