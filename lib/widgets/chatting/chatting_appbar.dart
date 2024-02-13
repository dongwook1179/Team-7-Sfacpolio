import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/screen/search.dart';

class Chatting_Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Chatting_Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 48,
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(children: [
        Expanded(
          child: Text(
            '채팅',
            style: TextStyle(
              color: Color(0xFF020202),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Search()));
          },
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            width: 24,
            height: 24,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        SvgPicture.asset(
          'assets/icons/cog.svg',
          width: 24,
          height: 24,
        )
      ]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48);
}
