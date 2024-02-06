import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/widgets/tag_slot.dart';

class Data_Slot extends StatefulWidget {
  final Map<String, dynamic> data;
  const Data_Slot(this.data);

  @override
  State<Data_Slot> createState() => _Data_SlotState();
}

class _Data_SlotState extends State<Data_Slot> {
  String Time_Conversion() {
    DateTime fixedDateTime = DateTime.parse(widget.data['update']);
    DateTime now = DateTime.now();
    Duration difference = now.difference(fixedDateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}일 전';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}시간 전';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}분 전';
    } else {
      return '방금 전';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 200,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xFFE6E6E6)))),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.data['type'],
            style: TextStyle(
              color: Color(0xFF0059FF),
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 232,
                height: 122,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data['title'],
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
                    Text(
                      widget.data['content'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFF4C4C4C),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    IntrinsicWidth(
                      child: Container(
                        height: 24,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    widget.data['avatar'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              widget.data['writer'],
                              style: TextStyle(
                                color: Color(0xFF4C4C4C),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 232,
                      height: 20,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (String text in widget.data['develop_type'])
                              Tag_Slot(text),
                            for (String text in widget.data['language'])
                              Tag_Slot(text)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 24,
              ),
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.data['image'],
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                  width: 16,
                  height: 16,
                  child: SvgPicture.asset('assets/icons/like.svg')),
              SizedBox(
                width: 2,
              ),
              IntrinsicWidth(
                child: Container(
                    child: Center(
                  child: Text(
                    '${widget.data['like'].length}',
                    style: TextStyle(
                      color: Color(0xFF7F7F7F),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  width: 16,
                  height: 16,
                  child: SvgPicture.asset('assets/icons/comment.svg')),
              SizedBox(
                width: 2,
              ),
              IntrinsicWidth(
                child: Container(
                    child: Center(
                  child: Text(
                    '${widget.data['comment'].length}',
                    style: TextStyle(
                      color: Color(0xFF7F7F7F),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  width: 16,
                  height: 16,
                  child: SvgPicture.asset('assets/icons/view.svg')),
              SizedBox(
                width: 2,
              ),
              IntrinsicWidth(
                child: Container(
                  child: Center(
                    child: Text(
                      '${widget.data['view'].length}',
                      style: TextStyle(
                        color: Color(0xFF7F7F7F),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Text(
                Time_Conversion(),
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
}
