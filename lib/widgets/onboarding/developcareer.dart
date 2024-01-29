import 'package:flutter/cupertino.dart';

class DevelopCareer extends StatefulWidget {
  const DevelopCareer({super.key});

  @override
  State<DevelopCareer> createState() => _CareerState();
}

class _CareerState extends State<DevelopCareer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
      child: Column(
        children: [
          Text(
            '개발 경력 기간',
            style: TextStyle(
              color: Color(0xFF0000000),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }
}
