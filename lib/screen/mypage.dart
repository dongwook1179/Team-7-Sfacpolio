import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/screen/editprofile.dart';
import 'package:team_7_sfacpolio/screen/follow.dart';
import 'package:team_7_sfacpolio/screen/myactivity.dart';
import 'package:team_7_sfacpolio/screen/myapagelist.dart';
import 'package:team_7_sfacpolio/screen/mypost.dart';
import 'package:team_7_sfacpolio/screen/setting.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Setting()));
                },
                child: SvgPicture.asset('assets/icon/cog.svg')),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Column(children: [
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return EditProfile();
                          }));
                        },
                        child: Container(
                          width: 165,
                          height: 27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF0059FF),
                          ),
                          child: Center(
                            child: Text(
                              '프로필 편집',
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyPost()));
                    },
                    child: Column(
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
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Follow(1)));
                    },
                    child: Column(
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
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Follow(0)));
                    },
                    child: Column(
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
            Container(
              width: 360,
              height: 50,
              child: TabBar(
                controller: _tabController,
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
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                MyPageList(),
                MyActivity(),
              ],
            ))
          ]),
        ));
  }
}
