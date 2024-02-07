import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/widgets/recent/community_slot_build.dart';

class Recent_Body extends StatefulWidget {
  final String type;
  const Recent_Body(this.type);

  @override
  State<Recent_Body> createState() => _Recent_BodyState();
}

class _Recent_BodyState extends State<Recent_Body> {
  bool page_load = false;
  Map<String, dynamic> data = {};
  Map<String, dynamic> data_division = {};
  Map<String, Widget> data_widget = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get_Data();
  }

  void Get_Data() async {
    Map<String, dynamic> data_load = {};
    if (widget.type == 'log') {
      data_load = await PocketBaseData().Get_Log();
    } else if (widget.type == 'community') {
      data_load = await PocketBaseData().Get_Community();
    }

    setState(() {
      data = data_load;
      page_load = true;
    });

    Data_Division();
    Widget_Build();
  }

  void Data_Division() {
    DateTime now = DateTime.now();

    for (String key in data.keys) {
      DateTime date = DateTime.parse(data[key]['update']);
      Duration difference = now.difference(date);
      if (difference.inHours < 24) {
        if (!data_division.containsKey('오늘')) {
          data_division['오늘'] = [];
        }
        data_division['오늘'].add(data[key]);
      } else if (difference.inHours < 48) {
        if (!data_division.containsKey('어제')) {
          data_division['어제'] = [];
        }
        data_division['어제'].add(data[key]);
      } else {
        if (!data_division.containsKey('${date.month}월 ${date.day}일')) {
          data_division['${date.month}월 ${date.day}일'] = [];
        }
        data_division['${date.month}월 ${date.day}일'].add(data[key]);
      }
    }
  }

  void Widget_Build() {
    for (String key in data_division.keys) {
      data_widget[key] = Container(
        margin: EdgeInsets.only(
            top: data_division.keys.toList().indexOf(key) == 1 ? 18 : 10),
        child: Text(
          key,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
      );
      for (var data in data_division[key]) {
        data_widget[data['id']] = Community_Slot_Build(data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return page_load
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 11),
                    child: Text(
                      '${data.length}개',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: data_widget.values.toList()),
                ],
              ),
            ),
          )
        : Container();
  }
}
