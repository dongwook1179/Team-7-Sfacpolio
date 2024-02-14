import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/screen/follow.dart';
import 'package:team_7_sfacpolio/screen/myapagelist.dart';
import 'package:team_7_sfacpolio/widgets/mypage/mypagelog.dart';

class FollowingProfile extends StatefulWidget {
  final String id;
  const FollowingProfile(this.id);

  @override
  State<FollowingProfile> createState() => _FollowingProfileState();
}

class _FollowingProfileState extends State<FollowingProfile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Map<String, dynamic> data = {};
  bool page_load = false;
  int post_count = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    Get_Data();
  }

  void Get_Data() async {
    Map<String, dynamic> user = await PocketBaseData().Get_UserData(widget.id);
    setState(() {
      data = user;
      page_load = true;
      for (String key in data['post'].keys) {
        int count = data['post'][key].length;
        post_count += count;
      }
    });
    print(data['post']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: page_load
            ? Column(
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
                          child:
                              Image.asset('assets/images/service/light.png')),
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.navigate_before)),
                              Text(
                                data['user'].data['email'],
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 60, horizontal: 20),
                          child: Container(
                            width: 285,
                            child: Row(
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: ClipOval(
                                    child: Image.network(
                                      data['user'].data['avatar'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          data['user'].data['nickname'],
                                          style: TextStyle(
                                            color: Color(0xFF020202),
                                            fontSize: 18,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        subtitle: Text(
                                          (data['develop_type'][0]
                                                  ['develop_type'] ??
                                              ''),
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
                                          // Navigator.push(context,
                                          //     MaterialPageRoute(builder: (_) {
                                          //   return Follow(0);
                                          // }));
                                        },
                                        child: Container(
                                          width: 165,
                                          height: 27,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        '${post_count}',
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
                                        '${data['follow']['follower'].length}',
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
                                        '${data['follow']['following'].length}',
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
                      MyPageList(data),
                      MyPageLog(widget.id),
                    ],
                  ))
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF0059FF),
                ),
              ));
  }
}
