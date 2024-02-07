import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/recent/indicator_control.dart';

class Recent_Tabbar extends StatefulWidget implements PreferredSizeWidget {
  const Recent_Tabbar({super.key});

  @override
  State<Recent_Tabbar> createState() => _Recent_TabbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _Recent_TabbarState extends State<Recent_Tabbar> {
  List<String> tab_list = ['최근 본 로그', '최근 본 커뮤니티'];

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
            )),
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
