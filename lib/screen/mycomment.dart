import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/common/bottom_nav_bar.dart';
import 'package:team_7_sfacpolio/widgets/mycomment/mycomment_appbar.dart';
import 'package:team_7_sfacpolio/widgets/mycomment/mycomment_body.dart';
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
    String id = context.read<User_Data>().record.record!.id;

    Map<String, dynamic> load_data = await PocketBaseData().Get_MyComment(id);

    Map<String, dynamic> data_sort = Map.fromEntries(load_data.entries.toList()
      ..sort((a, b) => b.value['update'].compareTo(a.value['update'])));
    setState(() {
      data = data_sort;
      data_keys = data.keys.toList();
      page_load = true;
    });
    print('부모 클래스 진입 확인 ');
    print(data);
    print('부모 클래스 진입 확인 ');
    print(data_keys);
    Heart_Active();
  }

  void Heart_Active() {
    String id = context.read<User_Data>().record.record!.id;

    for (String key in data_keys) {
      for (var datas in data[key]['like']) {
        if (id == datas.data['user_id']) {
          data[key]['like_active'] = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page_load
          ? Container(
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
            )
          : Container(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
