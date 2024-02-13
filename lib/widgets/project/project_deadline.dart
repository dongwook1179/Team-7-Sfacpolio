import 'package:flutter/material.dart';

class Project_DeadLine extends StatefulWidget {
  final String start_time;
  const Project_DeadLine(this.start_time);

  @override
  State<Project_DeadLine> createState() => _Project_DeadLineState();
}

class _Project_DeadLineState extends State<Project_DeadLine> {
  String time = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Date_Division();
  }

  void Date_Division() {
    DateTime now = DateTime.now();
    DateTime dateTime = DateTime.parse(widget.start_time);
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
    return IntrinsicWidth(
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
    );
  }
}
