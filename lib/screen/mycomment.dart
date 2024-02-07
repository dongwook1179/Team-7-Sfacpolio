import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/mycomment/mycomment_appbar.dart';
import 'package:team_7_sfacpolio/widgets/mycomment/mycomment_body.dart';
import 'package:team_7_sfacpolio/widgets/mycomment/mycomment_tabbar.dart';

class MyComment extends StatefulWidget {
  const MyComment({super.key});

  @override
  State<MyComment> createState() => _MyCommentState();
}

class _MyCommentState extends State<MyComment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 360,
        height: 740,
        margin: EdgeInsets.only(top: 46),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [MyComment_Appbar(), MyComment_Tabbar(), MyComment_Body()],
        ),
      ),
    );
  }
}
