import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/widgets/project/project_create_type_number_select.dart';
import 'package:team_7_sfacpolio/widgets/project/project_create_type_select.dart';

class Project_Create_Type_Slot extends StatefulWidget {
  const Project_Create_Type_Slot({super.key});

  @override
  State<Project_Create_Type_Slot> createState() =>
      _Project_Create_Type_SlotState();
}

class _Project_Create_Type_SlotState extends State<Project_Create_Type_Slot> {
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
  String field_text = '';
  int field_member = 0;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 45,
        child: Row(
          children: [
            GestureDetector(
              onTap: () async {
                await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Project_Create_Type(field_text);
                  },
                ).then((value) => setState(() {
                      field_text = value;
                    }));
                print(field_text);
              },
              child: Container(
                width: 157,
                height: 45,
                padding: EdgeInsets.all(12),
                decoration: boxdeco,
                child: Row(
                  children: [
                    field_text != ''
                        ? Text(
                            field_text,
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : Text('직군 선택', style: textst),
                    Spacer(),
                    SvgPicture.asset(
                      'assets/icons/chevron-down.svg',
                      width: 16,
                      height: 16,
                      color: Color(0xff333333),
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
                    return Project_Create_Type_Number(field_member);
                  },
                ).then((value) => setState(() {
                      field_member = value;
                    }));
                print(field_member);
              },
              child: Container(
                width: 108,
                height: 45,
                padding: EdgeInsets.all(12),
                decoration: boxdeco,
                child: Row(
                  children: [
                    field_member != 0
                        ? Text(
                            '${field_member}명',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : Text('인원수 선택', style: textst),
                    Spacer(),
                    SvgPicture.asset(
                      'assets/icons/chevron-down.svg',
                      width: 16,
                      height: 16,
                      color: Color(0xff333333),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
