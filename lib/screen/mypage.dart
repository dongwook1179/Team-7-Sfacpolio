import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          '내 정보',
          style: TextStyle(
            color: Color(0xFF020202),
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          SvgPicture.asset('assets/icon/bell.svg'),
          SizedBox(
            width: 20,
          ),
          SvgPicture.asset('assets/icon/cog.svg'),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        width: 360,
        height: 740,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Row(children: [
                Image.asset(
                  'assets/images/service/Rectangle 12774.png',
                ),
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          '김스펙',
                          style: TextStyle(
                            color: Color(0xFF020202),
                            fontSize: 18,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          'Frontend Engineer',
                          style: TextStyle(
                            color: Color(0xFF7F7F7F),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 0.12,
                          ),
                        ),
                      ),
                      Container(
                        width: 165,
                        height: 27,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xFF7FACFF)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            '프로필 편집',
                            style: TextStyle(
                              color: Color(0xFF0059FF),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Container(
              width: 328,
              height: 43,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '내 게시물',
                        style: TextStyle(
                          color: Color(0xFF020202),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '23',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '팔로우',
                        style: TextStyle(
                          color: Color(0xFF020202),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '100',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '팔로잉',
                        style: TextStyle(
                          color: Color(0xFF020202),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '121',
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 360,
              height: 3,
              color: Color(0xFFF8f8F9),
            ),
            DefaultTabController(
              length: 2,
              child: Container(
                width: 360,
                height: 50,
                child: TabBar(
                  indicatorColor: Color(0xFF0059FF),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(
                    color: Color(0xFF0059FF),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                  tabs: [
                    Tab(
                      text: '프로필',
                    ),
                    Tab(
                      text: '나의 활동',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Container(
                width: 360,
                height: 52,
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
                            'assets/images/programing_logo/ instagram.svg',
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
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '프로필 완성도',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 180,
                      ),
                      Image.asset(
                          'assets/images/programing_logo/Profile completeness.png')
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Container(
                          width: 53,
                          height: 5,
                          decoration: ShapeDecoration(
                            color: Color(0xFF0059FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          width: 53,
                          height: 5,
                          decoration: BoxDecoration(color: Color(0xFFE6E6E6)),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          width: 53,
                          height: 5,
                          decoration: BoxDecoration(color: Color(0xFFE6E6E6)),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          width: 53,
                          height: 5,
                          decoration: BoxDecoration(color: Color(0xFFE6E6E6)),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          width: 53,
                          height: 5,
                          decoration: BoxDecoration(color: Color(0xFFE6E6E6)),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          width: 53,
                          height: 5,
                          decoration: ShapeDecoration(
                            color: Color(0xFFE6E6E6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Padding(
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
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '개발언어',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '개발언어',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
