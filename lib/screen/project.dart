import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/widgets/project/project_banner.dart';
import 'package:team_7_sfacpolio/widgets/project/project_floationg_button.dart';
import 'package:team_7_sfacpolio/widgets/project/project_post.dart';
import 'package:team_7_sfacpolio/widgets/project/project_select_box.dart';
import 'package:team_7_sfacpolio/widgets/project/project_top.dart';

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  bool page_load = false;
  Map<String, dynamic> data = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Data_Load();
  }

  void Data_Load() async {
    Map<String, dynamic> load_data = await PocketBaseData().Get_Projcet();

    Map<String, dynamic> data_sort = Map.fromEntries(load_data.entries.toList()
      ..sort((a, b) =>
          b.value.data['start_time'].compareTo(a.value.data['start_time'])));

    setState(() {
      data = data_sort;
      page_load = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Floating_Button(),
      body: page_load
          ? Container(
              width: 360,
              height: 585,
              decoration: BoxDecoration(color: Color(0xffffffff)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Project_Banner(),
                    Project_Select_Box(),
                    Project_Top(data.length),
                    Project_Post(data),
                    SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(
              color: Color(0xFF0059FF),
            )),
    );
  }
}
