import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/project/project_slot_build.dart';

class Project_Post extends StatefulWidget {
  final Map<String, dynamic> data;
  const Project_Post(this.data);

  @override
  State<Project_Post> createState() => _Project_PostState();
}

class _Project_PostState extends State<Project_Post> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Container(
      width: 360,
      child: Column(
        children: [
          for (String key in widget.data.keys)
            Project_Slot_Build(widget.data[key])
        ],
      ),
    ));
  }
}
