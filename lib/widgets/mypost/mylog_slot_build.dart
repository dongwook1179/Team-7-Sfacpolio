import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/tag_slot.dart';

class MyLog_slot_build extends StatefulWidget {
  final dynamic data;

  const MyLog_slot_build(this.data);

  @override
  State<MyLog_slot_build> createState() => _MyLog_slot_buildState();
}

class _MyLog_slot_buildState extends State<MyLog_slot_build> {
  String date = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Date_Division();
  }

  void Date_Division() {
    DateTime dateTime = DateTime.parse(widget.data.updated);
    String formattedDate =
        "${dateTime.year}.${_twoDigits(dateTime.month)}.${_twoDigits(dateTime.day)}";

    if (widget.data.data['image'].runtimeType == List) {
      setState(() {
        widget.data.data['image'] = widget.data.data['image'][0];
      });
    }

    setState(() {
      date = formattedDate;
    });
  }

  String _twoDigits(int n) {
    if (n >= 10) {
      return "$n";
    } else {
      return "0$n";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.read<Page_Controller>().Post_Delete_Select(widget.data.id);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 291,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: Color(0xFFE6E6E6),
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: ClipRRect(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 190,
                  padding: EdgeInsets.only(top: 12, left: 12, right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(widget.data.data['image']),
                        fit: BoxFit.cover),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.data.data['develop_type'].isNotEmpty
                          ? Tag_Slot(widget.data.data['develop_type'][0])
                          : Container(),
                      widget.data.data['language'].isNotEmpty
                          ? Tag_Slot(widget.data.data['language'][0])
                          : Container(),
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.data['title'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        date,
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
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            padding: EdgeInsets.only(left: 11),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.data.data['avatar']),
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
                          Spacer(),
                          SvgPicture.asset(
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
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
