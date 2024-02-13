import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/tag_slot.dart';

class LogportfolioWidget extends StatelessWidget {
  final String title;
  final String content;
  final AssetImage? thumbnail;
  final AssetImage? avatar;
  final String nickname;
  final String? tag1;
  final String? tag2;
  final String? tag3;
  final String? tag4;

  const LogportfolioWidget(
      {super.key,
      required this.title,
      required this.content,
      this.thumbnail,
      required this.avatar,
      required this.nickname,
      this.tag1,
      this.tag2,
      this.tag3,
      this.tag4});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
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
              if (thumbnail != null)
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
              if (thumbnail == null)
                SizedBox(
                  width: 328,
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
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: ShapeDecoration(
                      color: Colors.grey,
                      shape: OvalBorder(),
                      image: avatar != null
                          ? DecorationImage(image: avatar!, fit: BoxFit.cover)
                          : null,
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
                ],
              ),
              Container(
                height: 8,
              ),
              //20짜리는 태그 들어갈 공간
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
          if (thumbnail != null)
            SizedBox(
              width: 24,
            ),
          if (thumbnail != null)
            Container(
              width: 72,
              height: 72,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                image: DecorationImage(image: thumbnail!),
              ),
            ),
        ],
      ),
    );
  }
}
