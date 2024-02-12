import 'package:flutter/material.dart';

class ProfileUpDate extends StatefulWidget {
  const ProfileUpDate({Key? key}) : super(key: key);

  @override
  State<ProfileUpDate> createState() => _ProfileUpDateState();
}

class _ProfileUpDateState extends State<ProfileUpDate> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: 360,
          height: 195,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                width: 32,
                height: 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xFFCCCCCC)),
                child: Text('사진업데이트'),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          child: Text('Show Bottom Sheet'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileUpDate(),
  ));
}
