import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/chatting/chatting_appbar.dart';
import 'package:team_7_sfacpolio/widgets/chatting/chatting_body.dart';
import 'package:team_7_sfacpolio/widgets/chatting/chatting_tapbar.dart';

class Chatting extends StatefulWidget {
  const Chatting({super.key});

  @override
  State<Chatting> createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              title: Chatting_Appbar(),
              bottom: Chatting_Tabbar(),
            ),
          ),
          body: TabBarView(
            children: [
              Chatting_Body('project'),
              Chatting_Body('employment'),
              Container(
                child: Text('개인'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
