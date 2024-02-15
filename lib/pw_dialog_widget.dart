import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/login_page.dart';

class PwDialogWidget extends StatefulWidget {
  const PwDialogWidget({super.key});

  @override
  State<PwDialogWidget> createState() => _PwDialogWidgetState();
}

class _PwDialogWidgetState extends State<PwDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 360,
        height: 740,
        decoration: BoxDecoration(color: Color(0xFF000000).withOpacity(0.3)),
        child: Center(
            child: Container(
          width: 328,
          height: 180,
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
              ),
              Container(
                child: Text(
                  '전송완료',
                  style: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '로그인 페이지로 이동합니다.',
                style: TextStyle(
                  color: Color(0xFF4C4C4C),
                  fontSize: 15,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Container(
                  width: 296,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFF0059FF),
                  ),
                  child: Center(
                    child: Text(
                      '확인',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
