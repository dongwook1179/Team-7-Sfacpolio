import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  _DropDown createState() => _DropDown();
}

class _DropDown extends State<DropDown> {
  String dropdownValue = '최신순';

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 32,
        child: PopupMenuButton(
          constraints: BoxConstraints(maxWidth: 76),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide.none,
          ),
          color: Colors.white,
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
            if (dropdownValue == '최신순') {
              context.read<Page_Controller>().Drop_Down('update');
            } else if (dropdownValue == '좋아요순') {
              context.read<Page_Controller>().Drop_Down('like_num');
            }
          },
          itemBuilder: (BuildContext) => [
            PopupMenuItem(
              value: '최신순',
              child: Center(
                child: IntrinsicWidth(
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      '최신순',
                      style: TextStyle(
                          fontFamily: 'Pretendard', color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            PopupMenuItem(
              value: '좋아요순',
              child: Center(
                child: IntrinsicWidth(
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      '좋아요순',
                      style: TextStyle(
                          fontFamily: 'Pretendard', color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
