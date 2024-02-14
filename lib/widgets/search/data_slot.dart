import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/tag_slot.dart';

class Data_Slot extends StatefulWidget {
  final RecordModel data;
  const Data_Slot(this.data);

  @override
  State<Data_Slot> createState() => _Data_SlotState();
}

class _Data_SlotState extends State<Data_Slot> {
  List<String> language_list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('크리에이트 : ${widget.data.created} ');
    print('조회 : ${widget.data.data['view']} ');
    print('댓글 : ${widget.data.data['comment']} ');
    print('좋아요 : ${widget.data.data['like']} ');
    print('사진 : ${widget.data.data['image']} ');
    print('언어 : ${widget.data.data['language']} ');
    print('언어_타입: ${widget.data.data['language'].runtimeType} ');
    print('직군 : ${widget.data.data['develop_type']} ');
    print('작성자 : ${widget.data.data['nickname']} ');
    print('아바타 : ${widget.data.data['avatar']} ');
    print('내용 : ${widget.data.data['content']} ');
    print('제목 : ${widget.data.data['title']} ');
    print('타입 : ${widget.data.data['post_type']} ');
    if (widget.data.data['image'].runtimeType == List<String>) {
      widget.data.data['image'] = widget.data.data['image'][0];
    }
    try {
      for (dynamic data in widget.data.data['language']) {
        setState(() {
          language_list.add(data['language']);
        });
      }
    } catch (e) {
      for (dynamic text in widget.data.data['language'])
        language_list.add(text.toString());
    }
  }

  String Time_Conversion() {
    DateTime fixedDateTime = DateTime.parse(widget.data.created);
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
    return IntrinsicHeight(
      child: Container(
        width: 360,
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
                              for (String text in language_list) Tag_Slot(text)
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
                              image: NetworkImage(widget.data.data['image']),
                              fit: BoxFit.cover,
                            )),
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
                widget.data.data['like']
                        .contains(context.read<User_Data>().record.record!.id)
                    ? Container(
                        width: 16,
                        height: 16,
                        child: SvgPicture.asset(
                          'assets/icons/Property 2=Outline, Property 3=heart, Property 4=active.svg',
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        width: 16,
                        height: 16,
                        child: SvgPicture.asset(
                          'assets/icons/like.svg',
                          color: Color(0xff999999),
                          fit: BoxFit.cover,
                        ),
                      ),
                SizedBox(
                  width: 2,
                ),
                IntrinsicWidth(
                  child: Container(
                      child: Center(
                    child: Text(
                      '${(widget.data.data['like'] ?? []).length}',
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
      ),
    );
  }
}
