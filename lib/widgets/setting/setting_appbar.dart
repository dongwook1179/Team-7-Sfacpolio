import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Setting_Appbar extends StatefulWidget {
  const Setting_Appbar({super.key});

  @override
  State<Setting_Appbar> createState() => _Setting_AppbarState();
}

class _Setting_AppbarState extends State<Setting_Appbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 41,
      padding: EdgeInsets.symmetric(vertical: 9),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/icons/chevron-left.svg',
              width: 24,
              height: 24,
              alignment: Alignment.centerLeft,
            ),
          ),
          SizedBox(
            width: 114,
          ),
          Center(
            child: Text(
              '설정',
              style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.1),
            ),
          ),
        ],
      ),
    );
  }
}
