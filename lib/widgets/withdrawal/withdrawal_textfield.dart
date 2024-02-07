import 'package:flutter/material.dart';

class Withdrawal_TextField extends StatefulWidget {
  final String type;
  const Withdrawal_TextField(this.type);

  @override
  State<Withdrawal_TextField> createState() => _Withdrawal_TextFieldState();
}

class _Withdrawal_TextFieldState extends State<Withdrawal_TextField> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 49,
      child: TextField(
        controller: textEditingController,
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          filled: true,
          fillColor: Color(0xFFF8F8F9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
          ),
        ),
      ),
    );
  }
}
