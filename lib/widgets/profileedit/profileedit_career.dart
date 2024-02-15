import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/widgets/profileedit/profileedit_career_period_select.dart';
import 'package:team_7_sfacpolio/widgets/profileedit/profileedit_career_type_select.dart';

class Profile_Edit_Career extends StatefulWidget {
  final Map<String, dynamic> data;
  const Profile_Edit_Career(this.data);

  @override
  State<Profile_Edit_Career> createState() => _Profile_Edit_CareerState();
}

class _Profile_Edit_CareerState extends State<Profile_Edit_Career> {
  BoxDecoration boxdeco = BoxDecoration(
    border: Border.all(width: 1, color: Color(0xFFCCCCCC)),
    borderRadius: BorderRadius.circular(8),
  );

  TextStyle textst = TextStyle(
    color: Color(0xFF999999),
    fontSize: 14,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w400,
  );

  TextStyle input_style = TextStyle(
    color: Color(0xFF020202),
    fontSize: 14,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w400,
  );
  String type = '타입';
  String period = '기간';
  TextEditingController company = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Input_Data();
  }

  void Input_Data() {
    if (widget.data != {}) {
      setState(() {
        if (widget.data['type'] == 'company') {
          type = '경력';
        } else {
          type = '교육';
        }
        company.text = widget.data['company'];
        period = widget.data['period'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 272,
      height: 98,
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Profile_Edit_Career_type_Select(type);
                    },
                  ).then((value) => setState(() {
                        type = value;
                      }));
                },
                child: Container(
                  width: 83,
                  height: 45,
                  padding: EdgeInsets.all(12),
                  decoration: boxdeco,
                  child: Row(
                    children: [
                      Text(type,
                          style: widget.data == {} ? textst : input_style),
                      Spacer(),
                      SvgPicture.asset(
                        'assets/icons/chevron-down.svg',
                        width: 16,
                        height: 16,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Profile_Edit_Career_Period_Select(period);
                    },
                  ).then((value) => setState(() {
                        type = value;
                      }));
                },
                child: Container(
                  width: 183,
                  height: 45,
                  decoration: boxdeco,
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Text(period,
                          style: widget.data == {} ? textst : input_style),
                      Spacer(),
                      SvgPicture.asset(
                        'assets/icons/chevron-down.svg',
                        width: 16,
                        height: 16,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 272,
            height: 45,
            decoration: boxdeco,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: TextField(
              decoration: InputDecoration(
                  hintText: '업무 장소',
                  hintStyle: textst,
                  border: InputBorder.none),
              style: input_style,
              controller: company,
            ),
          )
        ],
      ),
    );
  }
}
