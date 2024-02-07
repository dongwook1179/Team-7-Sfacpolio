import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/interest/indicator_control.dart';

class Interest_Tabbar extends StatefulWidget implements PreferredSizeWidget {
  const Interest_Tabbar({super.key});

  @override
  State<Interest_Tabbar> createState() => _Interest_TabbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _Interest_TabbarState extends State<Interest_Tabbar> {
  List<String> tab_list = ['관심 로그', '관심 커뮤니티'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        tabs: [
          for (String text in tab_list)
            Tab(
              child: Container(
                width: 180,
                height: 36,
                child: Center(child: Text(text)),
              ),
            ),
        ],
        labelStyle: TextStyle(
          fontSize: 14,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w700,
        ),
        indicator: CustomTabIndicator(),
        labelColor: Color(0xFF0059FF), // 선택된 탭의 텍스트 색상
        unselectedLabelColor: Color(0xFFB3B3B3), // 선택되지 않은 탭의 텍스트 색상
      ),
    );
  }
}
