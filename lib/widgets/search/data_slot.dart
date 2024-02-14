import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:team_7_sfacpolio/widgets/tag_slot.dart';

class Data_Slot extends StatefulWidget {
  final RecordModel data;
  const Data_Slot(this.data);

  @override
  State<Data_Slot> createState() => _Data_SlotState();
}

class _Data_SlotState extends State<Data_Slot> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Data_Convertion();
    print('길이 확인');
    print(widget.data.data['like']);
    print(widget.data.data['comment']);
    print(widget.data.data['view']);
  }

  String Time_Conversion() {
    DateTime fixedDateTime = DateTime.parse(widget.data.updated);
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

  void Data_Convertion() {
    List<String> language = [];

    try {
      for (String data in widget.data.data['language']) {
        setState(() {
          language.add(data);
        });
      }
    } catch (e) {
      for (var data in widget.data.data['language']) {
        setState(() {
          language.add(data['language']);
        });
      }
    }
    setState(() {
      widget.data.data['language'] = language;
    });
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
            widget.data.data['post_type'],
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
                      widget.data.data['title'],
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.data.data['content'],
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
                                    widget.data.data['avatar'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              widget.data.data['nickname'],
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
                            for (String text
                                in widget.data.data['develop_type'])
                              Tag_Slot(text),
                            for (String text in widget.data.data['language'])
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
              widget.data.data['image'] != null
                  ? Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(
                            (widget.data.data['image'].runtimeType ==
                                    List<String>)
                                ? widget.data.data['image'][0]
                                : widget.data.data['image'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      width: 72,
                      height: 72,
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
                    '${widget.data.data['like'].length}',
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
                    '${(widget.data.data['comment'] ?? []).length}',
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
                      '${(widget.data.data['view'] ?? []).length}',
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
