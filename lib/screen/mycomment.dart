import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/widgets/common/bottom_nav_bar.dart';
import 'package:team_7_sfacpolio/widgets/mycomment/mycomment_appbar.dart';
import 'package:team_7_sfacpolio/widgets/mycomment/mycomment_body.dart';
import 'package:team_7_sfacpolio/widgets/mycomment/mycomment_tabbar.dart';
import 'package:team_7_sfacpolio/widgets/mycomment/mycomment_top.dart';

class MyComment extends StatefulWidget {
  const MyComment({super.key});

  @override
  State<MyComment> createState() => _MyCommentState();
}

class _MyCommentState extends State<MyComment> {
  Map<String, dynamic> data = {};
  Map<String, Widget> data_widget = {};
  bool page_load = false;
  List<String> data_keys = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get_Data();
  }

  void Get_Data() async {
    Map<String, dynamic> load_data = await PocketBaseData().Get_MyComment();
    setState(() {
      data = load_data;
      data_keys = data.keys.toList();
      page_load = true;
    });
    Heart_Active();
  }

  void Heart_Active() {
    for (String key in data_keys) {
      for (var datas in data[key]['like']) {
        print(data);
        if ('modeumi19950804' == datas.data['user_id']) {
          data[key]['like_active'] = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 360,
        height: 740,
        margin: EdgeInsets.only(top: 46),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            MyComment_Appbar(),
            MyComment_Top(data_keys),
            MyComment_Body(data)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
