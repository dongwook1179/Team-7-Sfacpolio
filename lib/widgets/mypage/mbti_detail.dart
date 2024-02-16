import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/jsondata/dataload.dart';

class MbtiDetail extends StatefulWidget {
  final String mbti;
  const MbtiDetail(this.mbti);

  @override
  State<MbtiDetail> createState() => _MbtiDetailState();
}

class _MbtiDetailState extends State<MbtiDetail> {
  Map<String, dynamic> data = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get_Data();
  }

  void Get_Data() async {
    Map<String, dynamic> mbti_data = await DataLoad().JsonLoad('mbti');

    setState(() {
      data = mbti_data[widget.mbti];
    });
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 125,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color(0xFFF3F3F3),
          ),
          borderRadius: BorderRadius.circular(8)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${data['mbti']}(${data['title']})',
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 15,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            for (String text in data['content'])
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Icon(
                      Icons.brightness_1,
                      color: Color(0xFF000000),
                      size: 4,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                for (String text in data['tag'])
                  IntrinsicWidth(
                    child: Container(
                      margin: EdgeInsets.only(right: 6),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color(0xFFE5EEFF),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                          child: Text(
                        text,
                        style: TextStyle(
                          color: Color(0xFF0059FF),
                          fontSize: 11,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      )),
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
