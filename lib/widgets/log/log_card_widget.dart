import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/widgets/tag_slot.dart';

class LogCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFE6E6E6)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 328,
            height: 190,
            alignment: Alignment.topLeft,
            decoration: ShapeDecoration(
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 12, top: 12),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  Tag_Slot("JAVA"),
                  Tag_Slot("Python"),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 296,
                  child: Text(
                    '개발자가 되기 위한 5일의 기록',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  '2024.01.20',
                  style: TextStyle(
                    color: Color(0xFF7F7F7F),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(34.29),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Master0332',
                          style: TextStyle(
                            color: Color(0xFF020202),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/eye.svg",
                          color: Color(0xFF7F7F7F),
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          '2.7k',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF7F7F7F),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          "assets/icons/heart.svg",
                          color: Color(0xFF7F7F7F),
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          '999+',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF7F7F7F),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          "assets/icons/chat-alt.svg",
                          color: Color(0xFF7F7F7F),
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          '220',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF7F7F7F),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
