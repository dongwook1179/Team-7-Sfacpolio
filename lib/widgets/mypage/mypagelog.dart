import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/widgets/mypage/mylog_slot_build.dart';

class MyPageLog extends StatefulWidget {
  final String id;
  const MyPageLog(this.id);

  @override
  State<MyPageLog> createState() => _MyPageLogState();
}

class _MyPageLogState extends State<MyPageLog>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool page_load = false;
  Map<String, dynamic> log = {};

  @override
  void initState() {
    super.initState();
    Get_Data();
  }

  void Get_Data() async {
    Map<String, dynamic> data = await PocketBaseData().Get_My_Log(widget.id);

    setState(() {
      log = data;
      page_load = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [for (String key in log.keys) MyLog_slot_build(log[key])],
          ),
        ),
      ),
    );
  }
}

class CardData {
  final AssetImage backgroundimage;
  final String? title;
  final String? subtitle;

  CardData({
    this.title,
    this.subtitle,
    required this.backgroundimage,
  });
}
