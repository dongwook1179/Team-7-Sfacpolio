import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/project/project_banner.dart';

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 360,
        height: 585,
        decoration: BoxDecoration(color: Color(0xffffffff)),
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Project_Banner()
          ],
        ),
      ),
    );
  }
}
