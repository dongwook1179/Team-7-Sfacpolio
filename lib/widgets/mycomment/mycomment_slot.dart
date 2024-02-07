import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';

class MyComment_Slot_Build extends StatefulWidget {
  final Map<String, dynamic> data;
  const MyComment_Slot_Build(this.data);

  @override
  State<MyComment_Slot_Build> createState() => _MyComment_Slot_BuildState();
}

class _MyComment_Slot_BuildState extends State<MyComment_Slot_Build> {
  String date = '';
  bool like_active = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Date_Division();
  }

  void Date_Division() {
    DateTime originalDate = DateTime.parse(widget.data['update']);
    String date_divison = DateFormat('MM/dd').format(originalDate);
    setState(() {
      like_active = false;
    });
    print(widget.data['user_id']);
    for (var data in widget.data['like']) {
      if ('modeumi19950804' == data.data['user_id']) {
        setState(() {
          like_active = true;
        });
      }
    }
    setState(() {
      date = date_divison;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Page_Controller>(builder: (context, pageController, _) {
      return Container(
        width: 360,
        height: 108,
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 4, color: Color(0xfff8f8f9)))),
        child: Column(
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
              height: 8,
            ),
            IntrinsicWidth(
              child: Container(
                height: 36,
                child: Text(
                  widget.data['content'],
                  style: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            IntrinsicWidth(
              child: Container(
                height: 18,
                child: Row(
                  children: [
                    // (context.read<User_Data>().record.record?.id ?? '') ==
                    (widget.data['like_active'] ?? false)
                        ? SvgPicture.asset(
                            'assets/icons/Property 2=Outline, Property 3=heart, Property 4=active.svg',
                            width: 12,
                            height: 12,
                          )
                        : SvgPicture.asset(
                            'assets/icons/like.svg',
                            width: 12,
                            height: 12,
                          ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      '${widget.data['like'].length}',
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
                    Text(
                      date,
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
            ),
          ],
        ),
      );
    });
  }
}
