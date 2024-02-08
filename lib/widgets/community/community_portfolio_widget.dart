import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:team_7_sfacpolio/widgets/tag_slot.dart';

class CommunityPortfolioWidget extends StatelessWidget {
  final String title;
  final String content;
  final AssetImage thumbnail;
  final AssetImage? avatar;
  final String nickname;
  final String? tag1;
  final String? tag2;
  final String? tag3;
  final String? tag4;
  final String? tag5;
  final String job;
  final int like;
  final int comment;
  final int view;

  const CommunityPortfolioWidget(
      {super.key,
      required this.title,
      required this.content,
      required this.thumbnail,
      required this.avatar,
      required this.nickname,
      this.tag1,
      this.tag2,
      this.tag3,
      this.tag4,
      this.tag5,
      required this.job,
      required this.like,
      required this.comment,
      required this.view});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (avatar != null)
                Container(
                  width: 24,
                  height: 24,
                  decoration: ShapeDecoration(
                    color: Colors.grey,
                    shape: OvalBorder(),
                    image: DecorationImage(image: avatar!),
                  ),
                ),
              if (avatar == null)
                Container(
                  width: 24,
                  height: 24,
                  decoration: ShapeDecoration(
                    color: Colors.grey,
                    shape: OvalBorder(),
                  ),
                ),
              SizedBox(
                width: 12,
              ),
              Text(
                nickname,
                style: TextStyle(
                  color: Color(0xFF4C4C4C),
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
                  color: Color(0xFFB3B3B3),
                  shape: OvalBorder(),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                job,
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF020202),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: 232,
                    height: 37,
                    child: Text(
                      content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFF4C4C4C),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 72,
                height: 72,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  image: DecorationImage(image: thumbnail),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 8,
          ),

          //20짜리는 태그 들어갈 공간
          Container(
            height: 20,
            child: Row(
              children: [
                if (tag1 != null)
                  IntrinsicWidth(
                    child: Container(
                      margin: EdgeInsets.only(right: 6),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 20,
                      decoration: BoxDecoration(
                        color: getTagBackgroundColor(tag1!),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          tag1!,
                          style: TextStyle(
                            color: getTagTextColor(tag1!),
                            fontSize: 11,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                if (tag2 != null) Tag_Slot(tag2!),
                if (tag3 != null) Tag_Slot(tag3!),
                if (tag4 != null) Tag_Slot(tag4!),
                if (tag5 != null) Tag_Slot(tag5!),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
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
                  SizedBox(
                    width: 10,
                  ),
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
                ],
              ),
              Text(
                '3시간 전',
                style: TextStyle(
                  color: Color(0xFFB3B3B3),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Color getTagTextColor(String tag) {
    switch (tag) {
      case '자유':
        return Color(0xFF9946C0);
      case '질문':
        return Color(0xFF069A65);
      case '스터디':
        return Color(0xFFD43434);
      default:
        return Color(0xFF0059FF); // 기본값 설정
    }
  }

  Color getTagBackgroundColor(String tag) {
    switch (tag) {
      case '자유':
        return Color(0xFFF6E5FF);
      case '질문':
        return Color(0xFFCDFFD5);
      case '스터디':
        return Color(0xFFFFE1E1);
      default:
        return Color(0xFFE5EEFF);
    }
  }
}
