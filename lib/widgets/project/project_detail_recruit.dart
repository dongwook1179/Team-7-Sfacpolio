import 'package:flutter/material.dart';

class Project_Detail_Recruit extends StatefulWidget {
  final Map<String, dynamic> data;
  const Project_Detail_Recruit(this.data);

  @override
  State<Project_Detail_Recruit> createState() => _Project_Detail_RecruitState();
}

class _Project_Detail_RecruitState extends State<Project_Detail_Recruit> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        margin: EdgeInsets.only(right: 8),
        height: 31,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.data['type'],
                  style: TextStyle(
                    color: Color(0xFF2C2C2C),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  ' ${widget.data['number']}명',
                  style: TextStyle(
                    color: widget.data['number'] == widget.data['member'].length
                        ? Color(0xFFB8B8B8)
                        : Color(0xFF516DFF),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              children: [
                for (int i = 0; i < widget.data['number']; i++)
                  Expanded(
                      child: Container(
                    height: 2,
                    margin: EdgeInsets.only(right: 1),
                    decoration: BoxDecoration(
                        color: i < widget.data['member'].length
                            ? Color(0xFF2F69FF)
                            : Color(0xFFD9D9D9)),
                  )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
