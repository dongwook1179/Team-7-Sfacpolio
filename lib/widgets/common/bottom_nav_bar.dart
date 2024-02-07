import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/navigation_provider.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      currentIndex: context.watch<NavigationProvider>().currentIndex,
      selectedItemColor: Color(0xFF0059FF),
      unselectedItemColor: Color(0xFF999999),
      unselectedLabelStyle: TextStyle(color: Color(0xFF999999)),
      selectedFontSize: 12,
      unselectedFontSize: 12,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      enableFeedback: false,
      iconSize: 24,
      onTap: (index) {
        context.read<NavigationProvider>().setIndex(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/home.svg",
            color: Color(0xFF999999),
          ),
          label: '메인',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/pencil-alt.svg",
            color: Color(0xFF999999),
          ),
          label: 'LOG',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/globe-alt.svg",
            color: Color(0xFF999999),
          ),
          label: 'SFAC',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/globe-alt.svg",
            color: Color(0xFF999999),
          ),
          label: '채팅',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/user.svg",
            color: Color(0xFF999999),
          ),
          label: '설정',
        ),
      ],
    );
  }
}
