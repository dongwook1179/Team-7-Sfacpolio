import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Comment extends StatefulWidget {
  final String nickname;
  final ImageProvider<Object> avatar;
  final String tag;
  const Comment(
      {super.key,
      required this.nickname,
      required this.avatar,
      required this.tag});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: ShapeDecoration(
                      image: DecorationImage(image: widget.avatar),
                      color: Colors.grey,
                      shape: OvalBorder(),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    widget.nickname,
                    style: TextStyle(
                      color: Color(0xFF7F7F7F),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    width: 2,
                    height: 2,
                    decoration: ShapeDecoration(
                      color: Color(0xFFB7B7B7),
                      shape: OvalBorder(),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    '백엔드',
                    style: TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  "assets/icons/dots-vertical.svg",
                  color: Color(0xFF7F7F7F),
                  width: 16,
                  height: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              '꾸준히 기록을 올리시네요! 대단하세요 !!\n저도 얼른 개발 공부하러 가야겠네요...',
              style: TextStyle(
                color: Color(0xFF030303),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 9,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.favorite_outline,
                    size: 16,
                    color: Color(0xFFB3B3B3),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '201',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/chat-alt.svg",
                        width: 16,
                        height: 16,
                        color: Color(0xFFB3B3B3),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        '답글쓰기',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFFB3B3B3),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
