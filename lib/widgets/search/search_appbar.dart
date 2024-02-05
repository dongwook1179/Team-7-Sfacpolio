import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search_Appbar extends StatefulWidget {
  const Search_Appbar({super.key});

  @override
  State<Search_Appbar> createState() => _Search_AppbarState();
}

class _Search_AppbarState extends State<Search_Appbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 48,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.pop(context);
            },
            child: Container(
              width: 48,
              height: 48,
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/chevron-left.svg',
                  width: 16,
                  height: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 103,
          ),
          Center(
            child: Text(
              '통합 검색',
              style: TextStyle(
                color: Color(0xFF020202),
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
