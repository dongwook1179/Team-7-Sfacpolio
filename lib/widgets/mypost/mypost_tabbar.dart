import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/mypost/indicator_control.dart';

class MyPost_Tabbar extends StatefulWidget implements PreferredSizeWidget {
  const MyPost_Tabbar({super.key});

  @override
  State<MyPost_Tabbar> createState() => _MyPost_TabbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyPost_TabbarState extends State<MyPost_Tabbar> {
  List<String> tab_list = ['나의 로그 ', '나의 커뮤니티', '나의 프로젝트'];

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
