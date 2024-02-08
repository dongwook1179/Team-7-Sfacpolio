import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/common/bottom_nav_bar.dart';
import 'package:team_7_sfacpolio/widgets/interest/interest_appbar.dart';
import 'package:team_7_sfacpolio/widgets/interest/interest_body.dart';
import 'package:team_7_sfacpolio/widgets/interest/interest_tabbar.dart';

class Interest extends StatefulWidget {
  const Interest({super.key});

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
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
                title: Interest_Appbar(),
                bottom: Interest_Tabbar(),
              ),
            ),
            body: TabBarView(
              children: [
                Container(
                  child: Interest_Body('log'),
                ),
                Container(
                  child: Interest_Body('community'),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
