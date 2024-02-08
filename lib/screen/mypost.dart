import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/widgets/common/bottom_nav_bar.dart';
import 'package:team_7_sfacpolio/widgets/mypost/mypost_appbar.dart';
import 'package:team_7_sfacpolio/widgets/mypost/mypost_body.dart';
import 'package:team_7_sfacpolio/widgets/mypost/mypost_tabbar.dart';

class MyPost extends StatefulWidget {
  const MyPost({super.key});

  @override
  State<MyPost> createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  bool page_load = false;
  Map<String, dynamic> data = {};
  List<String> tab_list = ['log', 'community', 'project'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get_Data();
  }

  void Get_Data() async {
    Map<String, dynamic> get_data = await PocketBaseData().Get_MyPost();
    setState(() {
      data = get_data;
      page_load = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page_load
          ? Container(
              width: 360,
              height: 740,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: BoxDecoration(color: Color(0xfffffffff)),
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(84),
                    child: AppBar(
                      title: MyPost_Appbar(),
                      bottom: MyPost_Tabbar(),
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Container(
                        child: MyPost_Body('log', (data['log'] ?? [])),
                      ),
                      Container(
                        child:
                            MyPost_Body('community', (data['community'] ?? [])),
                      ),
                      Container(
                        child: MyPost_Body('project', (data['project'] ?? [])),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
