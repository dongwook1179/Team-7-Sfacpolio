import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/widgets/mycomment/dropdown.dart';

class MyComment_Tabbar extends StatefulWidget {
  const MyComment_Tabbar({super.key});

  @override
  State<MyComment_Tabbar> createState() => _MyComment_TabbarState();
}

class _MyComment_TabbarState extends State<MyComment_Tabbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 48,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          DropDown(),
          Spacer(),
          GestureDetector(
            onTap: () {
              PocketBaseData().Get_MyComment();
            },
            child: Container(
              width: 51,
              height: 24,
              decoration: BoxDecoration(
                  color: Color(0xFF337AFF),
                  borderRadius: BorderRadius.circular(6)),
              child: Center(
                  child: Text(
                '전체 선택',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                ),
              )),
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Container(
            width: 51,
            height: 24,
            decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(6)),
            child: Center(
                child: Text(
              '삭제',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            )),
          )
        ],
      ),
    );
  }
}
