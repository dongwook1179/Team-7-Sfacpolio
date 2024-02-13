import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';

class Withdrawal_Button extends StatefulWidget {
  const Withdrawal_Button({super.key});

  @override
  State<Withdrawal_Button> createState() => _Withdrawal_ButtonState();
}

class _Withdrawal_ButtonState extends State<Withdrawal_Button> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 144,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFFFFFFF),
                border: Border.all(width: 1, color: Color(0xFF999999))),
            child: Center(
              child: Text(
                '취소',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            String user_id = context.read<User_Data>().record.record!.id;
            context.read<User_Data>().LogOut();
            PocketBaseData().Withdraw(user_id);
            Navigator.of(context).pop();
          },
          child: Container(
            width: 144,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF0059FF),
            ),
            child: Center(
              child: Text(
                '탈퇴하기',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
