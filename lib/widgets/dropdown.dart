import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  _DropDown createState() => _DropDown();
}

class _DropDown extends State<DropDown> {
  String dropdownValue = '최신순';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      height: 32,
      width: 58,
      child: PopupMenuButton(
        constraints: BoxConstraints(maxWidth: 76),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide.none,
        ),
        offset: Offset(16, 26),
        color: Colors.white,
        padding: EdgeInsets.zero,
        elevation: 0.3,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                dropdownValue,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              width: 2,
            ),
            SvgPicture.asset(
              'assets/icons/chevron-down.svg',
              width: 16,
              height: 16,
            ),
          ],
        ),
        onSelected: (value) {
          setState(() {
            dropdownValue = value;
          });
        },
        itemBuilder: (BuildContext) => [
          PopupMenuItem(
            value: '최신순',
            child: Center(
              child: Container(
                width: 46,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  '최신순',
                  style:
                      TextStyle(fontFamily: 'Pretendard', color: Colors.black),
                ),
              ),
            ),
          ),
          PopupMenuItem(
            value: '저장순',
            child: Center(
              child: Container(
                width: 46,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  '저장순',
                  style:
                      TextStyle(fontFamily: 'Pretendard', color: Colors.black),
                ),
              ),
            ),
          ),
          PopupMenuItem(
            value: '댓글순',
            child: Center(
              child: Container(
                width: 46,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  '댓글순',
                  style:
                      TextStyle(fontFamily: 'Pretendard', color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
