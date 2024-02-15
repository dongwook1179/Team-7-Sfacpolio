import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/navigation_provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/screen/chatting.dart';
import 'package:team_7_sfacpolio/screen/editprofile.dart';
import 'package:team_7_sfacpolio/screen/follow.dart';
import 'package:team_7_sfacpolio/screen/followingprofile.dart';
import 'package:team_7_sfacpolio/screen/interest.dart';
import 'package:team_7_sfacpolio/screen/mycomment.dart';
import 'package:team_7_sfacpolio/screen/mypage.dart';
import 'package:team_7_sfacpolio/screen/mypost.dart';
import 'package:team_7_sfacpolio/screen/onboarding.dart';
import 'package:team_7_sfacpolio/screen/project.dart';
import 'package:team_7_sfacpolio/screen/recent.dart';
import 'package:team_7_sfacpolio/screen/search.dart';
import 'package:team_7_sfacpolio/screen/setting.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Page_Controller()),
        ChangeNotifierProvider(create: (_) => User_Data()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          color: Color(0xFFFFFFFF),
          home: MyPage()),
    ),
  );
}
