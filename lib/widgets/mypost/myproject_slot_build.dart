import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/tag_slot.dart';

class MyProject_Slot_Build extends StatefulWidget {
  final dynamic data;
  const MyProject_Slot_Build(this.data);

  @override
  State<MyProject_Slot_Build> createState() => _MyProject_Slot_BuildState();
}

class _MyProject_Slot_BuildState extends State<MyProject_Slot_Build> {
  String time = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Date_Division();
  }

  void Date_Division() {
    DateTime now = DateTime.now();
    DateTime dateTime = DateTime.parse(widget.data.data['start_time']);
    Duration difference = dateTime.difference(now);
    setState(() {
      if (difference.inDays >= 1) {
        time = 'D-${difference.inDays}';
      } else if (difference.inDays == 0) {
        time = '마감일';
      } else {
        time = '마감';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<Page_Controller>().Post_Delete_Select(widget.data.id);
      },
      child: IntrinsicHeight(
        child: Container(
          width: 360,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 5, color: Color(0xFFE6E6E6)))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data.data['title'],
                            style: TextStyle(
                              color: Color(0xFF020202),
                              fontSize: 15,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            widget.data.data['content'],
                            style: TextStyle(
                              color: Color(0xFF7F7F7F),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
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
                      : IntrinsicWidth(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            height: 23,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 1,
                                color: time == '마감'
                                    ? Color(0xFF999999)
                                    : time == '마감일'
                                        ? Color(0xFFFFAFAF)
                                        : Color(0xFF7FACFF),
                              ),
                              color: time == '마감'
                                  ? Color(0xFFE6E6E6)
                                  : time == '마감일'
                                      ? Color(0xFFFFEAEA)
                                      : Color(0xFFE5EEFF),
                            ),
                            child: Center(
                              child: Text(
                                time,
                                style: TextStyle(
                                  color: time == '마감'
                                      ? Color(0xFF999999)
                                      : time == '마감일'
                                          ? Color(0xFFFF0000)
                                          : Color(0xFF0059FF),
                                  fontSize: 10,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  if (widget.data.data['develop_type'].length < 4)
                    for (String text in widget.data.data['develop_type'])
                      Tag_Slot(text)
                  else
                    for (int i = 0; i < 3; i++)
                      Tag_Slot(widget.data.data['develop_type'][i])
                ],
              ),
              Container(
                height: 1,
                margin: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color(0xFFE6E6E6),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 24,
                child: Row(
                  children: [
                    Text(
                      '${widget.data.data['recruit']}명',
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      '모집 중',
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        'assets/icons/Property 2=Outline, Property 3=heart, Property 4=active.svg',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}