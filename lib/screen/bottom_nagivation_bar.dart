import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

const homeIcon = 'assets/bottomnavigationbar/home.svg';
const logIcon = 'assets/bottomnavigationbar/pencil-alt.svg';
const sfacIcon = 'assets/bottomnavigationbar/globe-alt.svg';
const chatIcon = 'assets/bottomnavigationbar/chat-3.svg';
const mypageIcon = 'assets/bottomnavigationbar/user.svg';

class BottomNavigationProvider extends ChangeNotifier {
  int _index = 0;
  int get currentPage => _index;

  setCurrentPage(int index) {
    _index = index;
    notifyListeners();
  }
}

class BottomNavigtion extends StatelessWidget {
  BottomNavigtion({Key? key}) : super(key: key);
  late BottomNavigationProvider _bottomNavigationProvider;

  @override
  Widget build(BuildContext context) {
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
      body:
          SafeArea(child: [].elementAt(_bottomNavigationProvider.currentPage)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Container(child: SvgPicture.asset(homeIcon)),
              activeIcon: SvgPicture.asset(
                homeIcon,
                color: const Color(0xff0059ff),
              ),
              label: '메인'),
          BottomNavigationBarItem(
              icon: Container(child: SvgPicture.asset(logIcon)),
              activeIcon: SvgPicture.asset(
                homeIcon,
                color: const Color(0xff0059ff),
              ),
              label: 'LOG'),
          BottomNavigationBarItem(
              icon: Container(child: SvgPicture.asset(sfacIcon)),
              activeIcon: SvgPicture.asset(
                homeIcon,
                color: const Color(0xff0059ff),
              ),
              label: 'SFAC'),
          BottomNavigationBarItem(
              icon: Container(child: SvgPicture.asset(chatIcon)),
              activeIcon: SvgPicture.asset(
                homeIcon,
                color: const Color(0xff0059ff),
              ),
              label: '채팅'),
              
          BottomNavigationBarItem(
              icon: Container(child: SvgPicture.asset(mypageIcon)),
              activeIcon: SvgPicture.asset(
                homeIcon,
                color: const Color(0xff0059ff),
              ),
              label: '내정보'),
        ],
      ),
    );
  }
}
