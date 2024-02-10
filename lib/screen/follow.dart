import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/common/bottom_nav_bar.dart';
import 'package:team_7_sfacpolio/widgets/follow/follow_appbar.dart';
import 'package:team_7_sfacpolio/widgets/follow/follow_body.dart';
import 'package:team_7_sfacpolio/widgets/follow/follow_tabbar.dart';

class Follow extends StatefulWidget {
  const Follow({super.key});

  @override
  State<Follow> createState() => _FollowState();
}

class _FollowState extends State<Follow> {
  bool page_load = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get_Follow();
  }

  void Get_Follow() async {
    String id = context.read<User_Data>().record.record!.id;
    Map<String, dynamic> follow_data = await PocketBaseData().Get_Follow(id);
    Provider.of<Page_Controller>(context, listen: false)
        .Get_Follow(follow_data);
    setState(() {
      page_load = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return page_load
        ? Container(
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
                    title: Follow_Appbar(),
                    bottom: Follow_Tabbar(),
                  ),
                ),
                body: TabBarView(
                  children: [
                    Container(
                      child: Follow_Body('following'),
                    ),
                    Container(
                      child: Follow_Body('follower'),
                    ),
                  ],
                ),
                bottomNavigationBar: BottomNavBar(),
              ),
            ),
          )
        : Container();
  }
}
