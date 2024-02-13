import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/screen/search.dart';

class Recent_Appbar extends StatefulWidget {
  const Recent_Appbar({super.key});

  @override
  State<Recent_Appbar> createState() => _Recent_AppbarState();
}

class _Recent_AppbarState extends State<Recent_Appbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 48,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: SvgPicture.asset(
                'assets/icons/chevron-left.svg',
                width: 16,
                height: 16,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '최근 본 게시물',
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Search()));
            },
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
