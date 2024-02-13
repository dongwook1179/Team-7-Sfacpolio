import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/home_page.dart';
import 'package:team_7_sfacpolio/main_page.dart';
import 'package:team_7_sfacpolio/provider/navigation_provider.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int currentIndex = context.watch<NavigationProvider>().currentIndex;
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      currentIndex: context.watch<NavigationProvider>().currentIndex,
      selectedItemColor: Color(0xFF0059FF),
      unselectedItemColor: Color(0xFF999999),
      selectedFontSize: 12,
      unselectedFontSize: 12,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      enableFeedback: false,
      iconSize: 24,
      selectedLabelStyle: TextStyle(
        color: Color(0xFF0059FF),
        fontSize: 12,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: TextStyle(
        color: Color(0xFF999999),
        fontSize: 12,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w500,
      ),
      onTap: (index) {
        context.read<NavigationProvider>().setIndex(index);

        // switch (index) {
        //   case 0:
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => HomePage(),
        //       ),
        //     );
        //   case 1:
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => HomePage(),
        //       ),
        //     );
        //   case 2:
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => HomePage(),
        //       ),
        //     );
        //   case 3:
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => HomePage(),
        //       ),
        //     );
        //   case 4:
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => HomePage(),
        //       ),
        //     );
        //   default:
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => MainPage(),
        //       ),
        //     );
        // }
      },
      items: [
        _buildBottomNavigationBarItem(
          "assets/icons/home.svg",
          "메인",
          currentIndex == 0, // 현재 선택된 아이템의 인덱스 여부
        ),
        _buildBottomNavigationBarItem(
          "assets/icons/pencil-alt.svg",
          "LOG",
          currentIndex == 1,
        ),
        _buildBottomNavigationBarItem(
          "assets/icons/globe-alt.svg",
          "SFAC",
          currentIndex == 2,
        ),
        _buildBottomNavigationBarItem(
          "assets/icons/chat.svg",
          "채팅",
          currentIndex == 3,
        ),
        _buildBottomNavigationBarItem(
          "assets/icons/user.svg",
          "내정보",
          currentIndex == 4,
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String iconPath,
    String label,
    bool isSelected,
  ) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        color: isSelected ? Color(0xFF0059FF) : Color(0xFF999999),
      ),
      label: label,
    );
  }
}
