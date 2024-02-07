import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogCardHalfWidget extends StatelessWidget {
  const LogCardHalfWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159,
      padding: const EdgeInsets.only(bottom: 8.83),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.74, color: Color(0xFFE6E6E6)),
          borderRadius: BorderRadius.circular(5.89),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 159,
            height: 134.25,
            alignment: Alignment.topLeft,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/log/templete-project.png"),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 8.83, top: 8.83),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  IntrinsicWidth(
                    child: Container(
                      margin: EdgeInsets.only(right: 6),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xFFE5EEFF),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                          child: Text(
                        "JAVA",
                        style: TextStyle(
                          color: Color(0xFF0059FF),
                          fontSize: 8,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ),
                  ),
                  IntrinsicWidth(
                    child: Container(
                      margin: EdgeInsets.only(right: 6),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xFFE5EEFF),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                          child: Text(
                        "Python",
                        style: TextStyle(
                          color: Color(0xFF0059FF),
                          fontSize: 8,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.only(left: 11.05, right: 8.95),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    'Project 01',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '기간',
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 10,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/eye.svg",
                          color: Color(0xFF7F7F7F),
                          width: 11.77777,
                          height: 11.77777,
                        ),
                        SizedBox(
                          width: 1.47,
                        ),
                        Text(
                          '300',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF7F7F7F),
                            fontSize: 10,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
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
