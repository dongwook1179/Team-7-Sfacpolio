import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Project_Detail_Appbar extends StatefulWidget {
  final String title;
  const Project_Detail_Appbar(this.title);

  @override
  State<Project_Detail_Appbar> createState() => _Project_Detail_AppbarState();
}

class _Project_Detail_AppbarState extends State<Project_Detail_Appbar> {
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
              widget.title,
              style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 16,
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
