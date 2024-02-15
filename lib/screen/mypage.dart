import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
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

  Map<String, dynamic> data = {};
  bool page_load = false;
  int post_count = 0;

  @override
  void initState() {
    super.initState();
    Get_Data();
    _tabController = TabController(length: 2, vsync: this);
  }

  void Get_Data() async {
    // String id = context.read<User_Data>().record.record!.id;
    Map<String, dynamic> user = context.read<User_Data>().user_data;
    setState(() {
      data = user;
      print('사용자 정보');
      print(data);
      print(data.keys);
      print(data['language']);

      if (data['post'].length > 0) {
        for (String key in data['post'].keys) {
          int count = data['post'][key].length;
          post_count += count;
        }
      }
      page_load = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return page_load
        ? Scaffold(
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
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset('assets/icon/bell.svg')),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Row(children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(shape: BoxShape.circle),
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
                            subtitle: data['develop_type'].length != 0
                                ? Text(
                                    data['develop_type'][0]['develop_type'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 0.12,
                                    ),
                                  )
                                : Text(
                                    '',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyPost()));
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
                              '${post_count}',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Follow(1)));
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
                              '${data['follow']['follower'].length}',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Follow(0)));
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
                              '${data['follow']['following'].length}',
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
                  children: [MyPageList(data), MyActivity()],
                ))
              ]),
            ))
        : Center(
            child: CircularProgressIndicator(
              color: Color(0xFF0059FF),
            ),
          );
  }
}
