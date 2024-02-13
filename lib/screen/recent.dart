import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/common/bottom_nav_bar.dart';
import 'package:team_7_sfacpolio/widgets/recent/recent_appbar.dart';
import 'package:team_7_sfacpolio/widgets/recent/recent_body.dart';
import 'package:team_7_sfacpolio/widgets/recent/recent_tabbar.dart';

class Recent extends StatefulWidget {
  const Recent({super.key});

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  Map<String, dynamic> data_load = {};
  bool page_load = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get_Data();
  }

  void Get_Data() async {
    String id = context.read<User_Data>().record.record!.id;
    Map<String, dynamic> data_load_log =
        await PocketBaseData().Get_Recent_Log(id);
    Map<String, dynamic> data_load_com =
        await PocketBaseData().Get_Recent_Community(id);

    setState(() {
      data_load['log'] = data_load_log;
      data_load['community'] = data_load_com;
      page_load = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page_load
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
                      automaticallyImplyLeading: false,
                      title: Recent_Appbar(),
                      bottom: Recent_Tabbar(),
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Container(
                        child: Recent_Body(data_load['log']),
                      ),
                      Container(
                        child: Recent_Body(data_load['community']),
                      ),
                    ],
                  ),
                  bottomNavigationBar: BottomNavBar(),
                ),
              ),
            )
          : Container(),
    );
  }
}
