import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Project_Top extends StatefulWidget {
  final int data_count;
  const Project_Top(this.data_count);

  @override
  State<Project_Top> createState() => _Project_TopState();
}

class _Project_TopState extends State<Project_Top> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 40,
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            '${widget.data_count}개',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          Text(
            '마감순',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: 2,
          ),
          SvgPicture.asset(
            'assets/icons/chevron-down.svg',
            width: 16,
            height: 16,
          ),
          SizedBox(
            width: 4,
          ),
        ],
      ),
    );
  }
}
