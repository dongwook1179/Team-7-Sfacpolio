import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
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
  Map<String, dynamic> data_load = {};
  bool page_load = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get_Data();
  }

  void Get_Data() async {
    Map<String, dynamic> data_load_log = {};
    Map<String, dynamic> data_load_community = {};
    String id = context.read<User_Data>().record.record!.id;
    data_load_log = await PocketBaseData().Get_Interest_Log(id);
    data_load_community = await PocketBaseData().Get_Interest_Community(id);
    context.read<Page_Controller>().Drop_Down('update');

    setState(() {
      data_load['log'] = data_load_log;
      data_load['community'] = data_load_community;
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
                      title: Interest_Appbar(),
                      bottom: Interest_Tabbar(),
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Container(
                        child: Interest_Body(data_load['log']),
                      ),
                      Container(
                        child: Interest_Body(data_load['community']),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
