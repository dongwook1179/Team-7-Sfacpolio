import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/log_main_page.dart';
import 'package:team_7_sfacpolio/screen/editprofile.dart';
import 'package:team_7_sfacpolio/screen/follow.dart';
import 'package:team_7_sfacpolio/screen/myactivity.dart';
import 'package:team_7_sfacpolio/screen/myapagelist.dart';
import 'package:team_7_sfacpolio/screen/onboarding.dart';
import 'package:team_7_sfacpolio/widgets/mypage/mypagelog.dart';

class FollowingProfile extends StatefulWidget {
  const FollowingProfile({super.key});

  @override
  State<FollowingProfile> createState() => _FollowingProfileState();
}

class _FollowingProfileState extends State<FollowingProfile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: 360,
          height: 309,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(0.00, 1.00),
                  end: Alignment(0, -3),
                  colors: [
                Color(0xFF0059FF),
                Color(0x66C7DBFF),
                Color(0x19C7DBFF)
              ])),
          child: Stack(clipBehavior: Clip.none, children: [
            Positioned(
                bottom: -80,
                child: Image.asset('assets/images/service/light.png')),
            Positioned(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 3, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.navigate_before)),
                    Text(
                      'id_2535',
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SvgPicture.asset('assets/icons/search.svg'),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 30,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                child: Container(
                  width: 285,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/service/Ellipse 1716.png',
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                '개발장인',
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
                                  color: Colors.white,
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
                                  return Follow();
                                }));
                              },
                              child: Container(
                                width: 165,
                                height: 27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFCCDDFF),
                                ),
                                child: Center(
                                  child: Text(
                                    '팔로우',
                                    style: TextStyle(
                                      color: Color(0xFF0059FF),
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
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 35,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 274,
                  height: 76,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFCCDDFF)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '게시물',
                              style: TextStyle(
                                color: Color(0xFF337AFF),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '23',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 1,
                          height: 47,
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '팔로우',
                              style: TextStyle(
                                color: Color(0xFF337AFF),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '100',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 1,
                          height: 47,
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '팔로잉',
                              style: TextStyle(
                                color: Color(0xFF337AFF),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '121',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ),
            )
          ]),
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
                  text: '로그',
                ),
              ],
            )),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: [
            MyPageList(),
            MyPageLog(),
          ],
        ))
      ],
    ));
  }
}
