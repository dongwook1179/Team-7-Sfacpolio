import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/follow/indicator_control.dart';

class Follow_Tabbar extends StatefulWidget implements PreferredSizeWidget {
  const Follow_Tabbar({super.key});

  @override
  State<Follow_Tabbar> createState() => _Follow_TabbarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _Follow_TabbarState extends State<Follow_Tabbar> {
  List<String> tab_list = ['팔로잉', '팔로워'];

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
