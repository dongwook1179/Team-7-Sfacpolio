import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/widgets/tag_slot.dart';

class MainProgramCardWidget extends StatelessWidget {
  final AssetImage backgroundimage;
  final String content;
  final String? tag1;
  final String? tag2;
  final String? tag3;
  final String? tag4;

  const MainProgramCardWidget(
      {super.key,
      required this.backgroundimage,
      required this.content,
      this.tag1,
      this.tag2,
      this.tag3,
      this.tag4});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 202,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0x7F606060),
        image: DecorationImage(
          image: backgroundimage,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              content,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '교육 프로그램 전체보기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SvgPicture.asset(
                "assets/icons/chevron-right.svg",
                width: 16,
                height: 16,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(
            height: 46,
          ),
          Container(
            height: 20,
            child: Row(
              children: [
                if (tag1 != null) Tag_Slot(tag1!),
                if (tag2 != null) Tag_Slot(tag2!),
                if (tag3 != null) Tag_Slot(tag3!),
                if (tag4 != null) Tag_Slot(tag4!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
