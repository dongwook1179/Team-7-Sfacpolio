import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/dropdown.dart';
import 'package:team_7_sfacpolio/widgets/recent/recent_appbar.dart';
import 'package:team_7_sfacpolio/widgets/recent/recent_body.dart';
import 'package:team_7_sfacpolio/widgets/recent/recent_tabbar.dart';
import 'package:team_7_sfacpolio/widgets/recent/recent_tabbar_de.dart';
import 'package:team_7_sfacpolio/widgets/recent/recent_category.dart';

class Recent extends StatefulWidget {
  const Recent({super.key});

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 360,
      height: 740,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(color: Color(0xfffffffff)),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(84),
            child: AppBar(
              title: Recent_Appbar(),
              bottom: Recent_Tabbar(),
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                child: Recent_Body('log'),
              ),
              Container(
                child: Recent_Body('community'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
