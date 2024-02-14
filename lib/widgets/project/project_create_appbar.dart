import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';

class Project_Create_Appbar extends StatefulWidget {
  const Project_Create_Appbar({super.key});

  @override
  State<Project_Create_Appbar> createState() => _Project_Create_AppbarState();
}

class _Project_Create_AppbarState extends State<Project_Create_Appbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 41,
      padding: EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/icons/chevron-left.svg',
              width: 24,
              height: 24,
              alignment: Alignment.centerLeft,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () async {
              Navigator.pop(context);
              if (context.read<Page_Controller>().project_create.length > 6) {
                String user_id = context.read<User_Data>().record.record!.id;
                context
                    .read<Page_Controller>()
                    .Input_Project_info('else', 'user_id', user_id);
                await PocketBaseData().Create_Project(
                    context.read<Page_Controller>().project_create);
              }
            },
            child: Text(
              '등록',
              style: TextStyle(
                color: Color(0xFF0059FF),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
