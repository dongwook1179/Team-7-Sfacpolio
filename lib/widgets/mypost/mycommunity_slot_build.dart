import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/mypost/tag_slot.dart';

class MyCommunity_Slot_Build extends StatefulWidget {
  final dynamic data;

  const MyCommunity_Slot_Build(this.data);

  @override
  State<MyCommunity_Slot_Build> createState() => _MyCommunity_Slot_BuildState();
}

class _MyCommunity_Slot_BuildState extends State<MyCommunity_Slot_Build> {
  String time = '';
  bool like_state = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Time_Division();
  }

  void Time_Division() {
    DateTime now = DateTime.now();
    DateTime dateTime = DateTime.parse(widget.data.created);

    Duration difference = now.difference(dateTime);
    setState(() {
      if (difference.inDays >= 1) {
        time = DateFormat('MM/dd').format(dateTime); // 날짜 형태로 표시
      } else if (difference.inHours >= 2) {
        time = '${difference.inHours}시간 전';
      } else if (difference.inHours >= 1) {
        time = '1시간 전';
      } else if (difference.inMinutes >= 1) {
        time = '${difference.inMinutes}분 전';
      } else {
        time = '방금 전';
      }
      String id = context.read<User_Data>().record.record!.id;

      for (var data in widget.data.data['like']) {
        if (data.data['user_id'].contains(id)) {
          like_state = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<Page_Controller>().Post_Delete_Select(widget.data.id);
      },
      child: Container(
        width: 360,
        height: 198,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color(0xFFE6E6E6),
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 24,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(widget.data.data['avatar']),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    widget.data.data['nickname'],
                    style: TextStyle(
                      color: Color(0xFF020202),
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
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFB3B3B3)),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    '${widget.data.data['user_develop_type'][0]}',
                    style: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  context.watch<Page_Controller>().post_delete_active
                      ? Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                              color: context
                                      .watch<Page_Controller>()
                                      .post_delete_select
                                      .contains(widget.data.id)
                                  ? Color(0xFF0059FF)
                                  : Color(0xffffffff),
                              shape: BoxShape.circle),
                          child: Center(
                              child: SvgPicture.asset(
                            'assets/icons/check.svg',
                            width: 15,
                            height: 15,
                            color: context
                                    .watch<Page_Controller>()
                                    .post_delete_select
                                    .contains(widget.data.id)
                                ? Color(0xffffffff)
                                : Color(0xFFCCCCCC),
                          )),
                        )
                      : Container()
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 72,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 232,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data.data["title"],
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
                          widget.data.data["content"],
                          style: TextStyle(
                            color: Color(0xFF4C4C4C),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
                          image: NetworkImage(widget.data.data["image"][0]),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Tag_Slot(widget.data.data['topic']),
                Tag_Slot(widget.data.data['language'][0]),
                Tag_Slot(widget.data.data['develop_type'][0]),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                like_state
                    ? SvgPicture.asset(
                        'assets/icons/Property 2=Outline, Property 3=heart, Property 4=active.svg',
                        width: 16,
                        height: 16,
                      )
                    : SvgPicture.asset(
                        'assets/icons/like.svg',
                        width: 16,
                        height: 16,
                      ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  '${widget.data.data['like'].length}',
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
                  'assets/icons/comment.svg',
                  width: 16,
                  height: 16,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  '${widget.data.data['comment'].length}',
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
                  'assets/icons/view.svg',
                  width: 16,
                  height: 16,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  '${widget.data.data['view'].length}',
                  style: TextStyle(
                    color: Color(0xFF7F7F7F),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                Text(
                  time,
                  style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
