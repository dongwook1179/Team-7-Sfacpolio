import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Project_Create_Appbar extends StatefulWidget {
  const Project_Create_Appbar({super.key});

  @override
  State<Project_Create_Appbar> createState() => _Project_Create_AppbarState();
}

class _Project_Create_AppbarState extends State<Project_Create_Appbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 41,
      padding: EdgeInsets.symmetric(vertical: 9),
      child: Row(
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
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              '등록',
              style: TextStyle(
                color: Color(0xFF0059FF),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
