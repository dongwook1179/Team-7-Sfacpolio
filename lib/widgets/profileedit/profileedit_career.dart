import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/profileedit/profileedit_career_period_select.dart';
import 'package:team_7_sfacpolio/widgets/profileedit/profileedit_career_type_select.dart';

class Profile_Edit_Career extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  final bool state;
  const Profile_Edit_Career(this.data, this.state);

  @override
  State<Profile_Edit_Career> createState() => _Profile_Edit_CareerState();
}

class _Profile_Edit_CareerState extends State<Profile_Edit_Career> {
  String id = '';
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
    setState(() {
      id = widget.data['id'];
    });
  }

  void Input_Data() {
    print(widget.data);
    setState(() {
      if (widget.data['type'] == 'company') {
        type = '경력';
      } else if (widget.data['type'] == 'education') {
        type = '교육';
      }
      company.text = widget.data['company'];
      if (widget.data['period'] != '') {
        period = widget.data['period'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
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
                              if (value == '경력') {
                                widget.data['type'] = 'company';
                              } else {
                                widget.data['type'] = 'education';
                              }
                              type = value;
                              if (type != '타입' &&
                                  period != '기간' &&
                                  company.text != '') {
                                context.read<User_Data>().Career_Save({
                                  'id': id,
                                  'type': type,
                                  'company': company.text,
                                  'period': period
                                });
                              }
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
                                style: type == '타입' ? textst : input_style),
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
                              period = '${value[0]}년 ${value[1]}개월';
                              if (type != '타입' &&
                                  period != '기간' &&
                                  company.text != '') {
                                context.read<User_Data>().Career_Save({
                                  'id': id,
                                  'type': type,
                                  'company': company.text,
                                  'period': period
                                });
                              }
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
                                style: period == '기간' ? textst : input_style),
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
                    onEditingComplete: () {
                      if (type != '타입' &&
                          period != '기간' &&
                          company.text != '') {
                        context.read<User_Data>().Career_Save({
                          'id': id,
                          'type': type,
                          'company': company.text,
                          'period': period
                        });
                      }
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                        hintText: '업무 장소',
                        hintStyle: textst,
                        border: InputBorder.none),
                    style: input_style,
                    controller: company,
                  ),
                ),
              ],
            ),
          ),
          widget.state
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      context
                          .read<User_Data>()
                          .Career_Delete(widget.data['id']);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 6),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Color(0xFF0059FF),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        '삭제',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
