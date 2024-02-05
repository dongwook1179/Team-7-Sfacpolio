import 'package:flutter/material.dart';

class Tag_Slot extends StatefulWidget {
  final String text;
  const Tag_Slot(this.text);

  @override
  State<Tag_Slot> createState() => _Tag_SlotState();
}

class _Tag_SlotState extends State<Tag_Slot> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        margin: EdgeInsets.only(right: 6),
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: 20,
        decoration: BoxDecoration(
          color: Color(0xFFE5EEFF),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
            child: Text(
          widget.text,
          style: TextStyle(
            color: Color(0xFF0059FF),
            fontSize: 11,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }
}
