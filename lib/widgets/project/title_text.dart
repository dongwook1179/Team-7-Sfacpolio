import 'package:flutter/material.dart';

class Title_Text extends StatefulWidget {
  final String text;
  final bool essential;
  const Title_Text(this.text, this.essential);

  @override
  State<Title_Text> createState() => _Title_TextState();
}

class _Title_TextState extends State<Title_Text> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.text,
          style: TextStyle(
            color: Color(0xFF020202),
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        widget.essential
            ? Text(
                '*',
                style: TextStyle(
                  color: Color(0xFFFF0000),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              )
            : Container(),
      ],
    );
  }
}
