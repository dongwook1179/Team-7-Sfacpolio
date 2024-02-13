import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/mypost/mycommunity_slot_build.dart';
import 'package:team_7_sfacpolio/widgets/mypost/mylog_slot_build.dart';
import 'package:team_7_sfacpolio/widgets/mypost/mypost_top.dart';
import 'package:team_7_sfacpolio/widgets/mypost/myproject_slot_build.dart';

class MyPost_Body extends StatefulWidget {
  final String type;
  final List<dynamic> data;
  const MyPost_Body(this.type, this.data);

  @override
  State<MyPost_Body> createState() => _MyPost_BodyState();
}

class _MyPost_BodyState extends State<MyPost_Body> {
  List<String> data_key = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get_Data_Keys();
  }

  void Get_Data_Keys() {
    for (var data in widget.data) {
      setState(() {
        data_key.add(data.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyPost_Top(data_key),
            if (widget.type == 'log')
              for (var data in widget.data) MyLog_slot_build(data),
            if (widget.type == 'community')
              for (var data in widget.data) MyCommunity_Slot_Build(data),
            if (widget.type == 'project')
              for (var data in widget.data) MyProject_Slot_Build(data),
          ],
        ),
      ),
    );
  }
}
