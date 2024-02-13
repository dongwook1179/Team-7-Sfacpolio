import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/chatting/indicator_control.dart';

class Chatting_Tabbar extends StatefulWidget implements PreferredSizeWidget {
  const Chatting_Tabbar({super.key});

  @override
  State<Chatting_Tabbar> createState() => _Chatting_TabbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _Chatting_TabbarState extends State<Chatting_Tabbar> {
  List<String> tab_list = ['프로젝트', '채용', '개인'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        tabs: [
          for (String text in tab_list)
            Tab(
                child: Container(
              width: 120,
              height: 36,
              child: Center(child: Text(text)),
            )),
        ],
        labelStyle: TextStyle(
          fontSize: 14,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w700,
        ),
        indicator: CustomTabIndicator(),
        labelColor: Colors.black, // 선택된 탭의 텍스트 색상
        unselectedLabelColor: Color(0xFFB3B3B3), // 선택되지 않은 탭의 텍스트 색상
      ),
    );
  }
}
