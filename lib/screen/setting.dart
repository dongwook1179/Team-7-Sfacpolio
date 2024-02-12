import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/common/bottom_nav_bar.dart';
import 'package:team_7_sfacpolio/widgets/setting/setting_alarm.dart';
import 'package:team_7_sfacpolio/widgets/setting/setting_appbar.dart';
import 'package:team_7_sfacpolio/widgets/setting/setting_etc.dart';
import 'package:team_7_sfacpolio/widgets/setting/setting_proposal.dart';
import 'package:team_7_sfacpolio/widgets/setting/setting_sns.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  Map<String, dynamic> sns_data = {};
  bool page_load = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get_Data();
  }

  void Get_Data() async {
    // String user_id = context.read<User_Data>().record.record!.id;
    // Map<String, dynamic> get_data = await PocketBaseData().Get_SNS(user_id);
    Map<String, dynamic> get_data = await PocketBaseData().Get_SNS();
    setState(() {
      sns_data = get_data;
      page_load = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return page_load
        ? Consumer<Page_Controller>(builder: (context, pageController, _) {
            Get_Data();
            return Scaffold(
              appBar: AppBar(
                title: Setting_Appbar(),
              ),
              body: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Setting_Alarm(),
                      Setting_SNS(sns_data),
                      Setting_Proposal(),
                      Setting_Etc()
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: BottomNavBar(),
            );
          })
        : Container();
  }
}
