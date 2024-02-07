import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/log_main_page.dart';
import 'package:team_7_sfacpolio/main_page.dart';
import 'package:team_7_sfacpolio/provider/navigation_provider.dart';
import 'package:team_7_sfacpolio/screen/chatting.dart';
import 'package:team_7_sfacpolio/screen/commuitypage.dart';
import 'package:team_7_sfacpolio/widgets/common/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _getPage(context.watch<NavigationProvider>().currentIndex),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return MainPage();
      case 1:
        return LogMainPage();
      case 2:
        return CommuityPage();
      case 3:
        return Chatting();
      case 4:
        return Container();
      default:
        return MainPage();
    }
  }
}
