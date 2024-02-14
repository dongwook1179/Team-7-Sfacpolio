import 'package:flutter/material.dart';

class Text_Point extends StatefulWidget {
  final String text;
  const Text_Point(this.text);

  @override
  State<Text_Point> createState() => _Text_PointState();
}

class _Text_PointState extends State<Text_Point> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 25,
        child: Stack(
          children: [
            Positioned(
              bottom: 2,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 9,
                decoration: BoxDecoration(color: Color(0xFFCCDDFF)),
              ),
            ),
            Text(
              widget.text,
              style: TextStyle(
                color: Color(0xFF0059FF),
                fontSize: 18,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
