import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyPageList extends StatefulWidget {
  const MyPageList({super.key});

  @override
  State<MyPageList> createState() => _MyPageListState();
}

class _MyPageListState extends State<MyPageList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 360,
              height: 70,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFFCFCFC),
                          border: Border.all(color: Color(0xFFE7E7E7))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(
                          'assets/images/programing_logo/google.svg',
                        ),
                      )),
                  Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFFCFCFC),
                          border: Border.all(color: Color(0xFFE7E7E7))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(
                          'assets/images/programing_logo/github.svg',
                        ),
                      )),
                  Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFFCFCFC),
                          border: Border.all(color: Color(0xFFE7E7E7))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(
                          'assets/images/programing_logo/instagram.svg',
                        ),
                      )),
                  Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFFCFCFC),
                          border: Border.all(color: Color(0xFFE7E7E7))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset(
                          'assets/images/programing_logo/velog.png',
                        ),
                      )),
                  Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFFCFCFC),
                          border: Border.all(color: Color(0xFFE7E7E7))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(
                          'assets/images/programing_logo/notion.svg',
                        ),
                      )),
                ],
              ),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '소개',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '개발은 저에게 항상 즐겁고 재밌는 것입니다. 사용자에게 도움이 되는 서비스를 만들고 싶습니다.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '개발 언어',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                              width: 70,
                              height: 70,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFFB5B5B5)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                      'assets/programing logo/java-original.png'),
                                  Text(
                                    'JAVA',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                              width: 70,
                              height: 70,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 9),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFFB5B5B5)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                      'assets/programing logo/azure-original.png'),
                                  Text(
                                    'AUZRE',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                              width: 70,
                              height: 70,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 9),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFFB5B5B5)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                      'assets/programing logo/html5-original.png'),
                                  Text(
                                    'HTML5',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                              width: 70,
                              height: 70,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 19, vertical: 8),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFFB5B5B5)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                      'assets/programing logo/php-plain.png'),
                                  Text(
                                    'PHP',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                              width: 70,
                              height: 70,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 9),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFFB5B5B5)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                      'assets/programing logo/vuejs-line.png'),
                                  Text(
                                    'VUEJS',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 9),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFFB5B5B5)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                    'assets/programing logo/java-original.png'),
                                Text(
                                  'JAVA',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '개발 직군',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            width: 65,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFF0059FF),
                                )),
                            child: Center(
                              child: Text(
                                '웹 풀스택',
                                style: TextStyle(
                                  color: Color(0xFF0059FF),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            width: 65,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFF0059FF),
                                )),
                            child: Center(
                              child: Text(
                                '프론트엔드',
                                style: TextStyle(
                                  color: Color(0xFF0059FF),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            width: 65,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFF0059FF),
                                )),
                            child: Center(
                              child: Text(
                                '서버/백엔드',
                                style: TextStyle(
                                  color: Color(0xFF0059FF),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Container(
              height: 95,
              color: Colors.white,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '관심업종',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                              width: 41,
                              height: 32,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF0059FF),
                                  )),
                              child: Center(
                                child: Text(
                                  '건설',
                                  style: TextStyle(
                                    color: Color(0xFF0059FF),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 41,
                              height: 32,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF0059FF),
                                  )),
                              child: Center(
                                child: Text(
                                  '식품',
                                  style: TextStyle(
                                    color: Color(0xFF0059FF),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Container(
              height: 188,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      child: Text(
                        'MBTI',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      width: 328,
                      height: 125,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFF3F3F3)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ISTJ(현실주의자)',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '• 철저하고 체계적으로 일을 처리하는 경향이 있음.',
                              style: TextStyle(
                                color: Color(0xFF020202),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '• 프로젝트 일정과 목표에 대한 엄격한 계획을 선호함.',
                              style: TextStyle(
                                color: Color(0xFF020202),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 61,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Color(0xFFE5EEFF),
                                  ),
                                  child: Text(
                                    '현실적 사고',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF0059FF),
                                      fontSize: 11,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  width: 39,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Color(0xFFE5EEFF),
                                  ),
                                  child: Text(
                                    '책임감',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF0059FF),
                                      fontSize: 11,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  width: 61,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Color(0xFFE5EEFF),
                                  ),
                                  child: Text(
                                    '조직적 성향',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF0059FF),
                                      fontSize: 11,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '경력 사항',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/briefcase.svg'),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '와이엠에스닷코',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '2개월',
                              style: TextStyle(
                                color: Color(0xFF4C4C4C),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xFFF3F3F3),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/academic-cap.svg'),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '웅진 프로젝트',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '4개월',
                              style: TextStyle(
                                color: Color(0xFF4C4C4C),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '프로젝트 선호 조건',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            width: 52,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFF0059FF),
                                )),
                            child: Center(
                              child: Text(
                                '온라인',
                                style: TextStyle(
                                  color: Color(0xFF0059FF),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            width: 65,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFF0059FF),
                                )),
                            child: Center(
                              child: Text(
                                '6-9개월',
                                style: TextStyle(
                                  color: Color(0xFF0059FF),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
