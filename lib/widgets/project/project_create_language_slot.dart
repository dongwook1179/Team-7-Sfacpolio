import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/widgets/project/project_create_language_select.dart';

class Project_Create_Language_Slot extends StatefulWidget {
  const Project_Create_Language_Slot({super.key});

  @override
  State<Project_Create_Language_Slot> createState() =>
      _Project_Create_Language_SlotState();
}

class _Project_Create_Language_SlotState
    extends State<Project_Create_Language_Slot> {
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
  String language_text = '';
  String language_member = '';

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 45,
        child: GestureDetector(
          onTap: () async {
            print('클릭');
            await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Project_Create_Language(language_text);
              },
            ).then((value) => setState(() {
                  language_text = value;
                }));
          },
          child: Container(
            height: 45,
            width: 270,
            padding: EdgeInsets.all(12),
            decoration: boxdeco,
            child: Row(
              children: [
                language_text != ''
                    ? Text(
                        language_text,
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : Text('언어 선택', style: textst),
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
      ),
    );
  }
}
