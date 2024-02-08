import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogCardWidget extends StatelessWidget {
  final AssetImage backgroundimage;
  final String? tag1;
  final String? tag2;
  final String? tag3;
  final String title;
  final DateTime logdate;
  final AssetImage? avatar;
  final String nickname;
  final int view;
  final int like;
  final int comment;

  const LogCardWidget(
      {super.key,
      required this.backgroundimage,
      this.tag1,
      this.tag2,
      this.tag3,
      required this.title,
      required this.logdate,
      this.avatar,
      required this.nickname,
      required this.view,
      required this.like,
      required this.comment});

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
              image: DecorationImage(image: backgroundimage, fit: BoxFit.cover),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 12, top: 12),
              child: Row(
                children: [
                  if (tag1 != "")
                    Container(
                      margin: EdgeInsets.only(right: 4),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xFFE5EEFF),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          tag1!,
                          style: TextStyle(
                            color: Color(0xFF0059FF),
                            fontSize: 10.3,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  if (tag2 != "")
                    Container(
                      margin: EdgeInsets.only(right: 4),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xFFE5EEFF),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          tag2!,
                          style: TextStyle(
                            color: Color(0xFF0059FF),
                            fontSize: 10.3,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  if (tag3 != "")
                    Container(
                      margin: EdgeInsets.only(right: 4),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xFFE5EEFF),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          tag3!,
                          style: TextStyle(
                            color: Color(0xFF0059FF),
                            fontSize: 10.3,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
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
                    title,
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
                  "${logdate.year}.${logdate.month}.${logdate.day}",
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
                          decoration: ShapeDecoration(
                            color: Colors.grey,
                            shape: OvalBorder(),
                            image: avatar != null
                                ? DecorationImage(
                                    image: avatar!, fit: BoxFit.cover)
                                : null,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          nickname,
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
                          view.toString(),
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
                          like.toString(),
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
                          comment.toString(),
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
