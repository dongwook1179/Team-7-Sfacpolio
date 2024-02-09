import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/screen/withdrawal.dart';
import 'package:team_7_sfacpolio/widgets/setting/logout_dialog.dart';
import 'package:team_7_sfacpolio/widgets/setting/terms_in_setting.dart';

class Setting_Etc extends StatefulWidget {
  const Setting_Etc({super.key});

  @override
  State<Setting_Etc> createState() => _Setting_EtcState();
}

class _Setting_EtcState extends State<Setting_Etc> {
  List<String> text = ['이용약관&개인정보처리방침', '로그아웃', '회원 탈퇴'];
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 9),
        child: Column(
          children: [
            for (String key in text)
              GestureDetector(
                onTap: () async {
                  if (text.indexOf(key) == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Terms(),
                      ),
                    );
                  } else if (text.indexOf(key) == 1) {
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Scaffold(
                            body: LogOut_Dialog(),
                            backgroundColor: Color(0xffffffff).withOpacity(0),
                          );
                        });
                  } else if (text.indexOf(key) == 2) {
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Scaffold(
                            body: Withdrawal(),
                            backgroundColor: Color(0xffffffff).withOpacity(0),
                          );
                        });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xFFE6E6E6)))),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 12),
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Text(
                        key,
                        style: TextStyle(
                          color: text.indexOf(key) == 0
                              ? Colors.black
                              : Color(0xFFFF0000),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
