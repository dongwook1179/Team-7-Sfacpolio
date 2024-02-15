import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/navigation_provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/splash_page.dart';

void main() async {
  await initializeDateFormatting('ko-KR', null);

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
        home: MyApp(),
      ),
    ),
  );
}
