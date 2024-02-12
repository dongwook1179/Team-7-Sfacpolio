import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/widgets/project/project_create.dart';

class Floating_Button extends StatefulWidget {
  const Floating_Button({super.key});

  @override
  State<Floating_Button> createState() => _Floating_ButtonState();
}

class _Floating_ButtonState extends State<Floating_Button> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Project_Create(),
          ),
        );
      },
      backgroundColor: Color(0xFF196AFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
          ),
        ),
        child: SvgPicture.asset(
          "assets/icons/pencil.svg",
          color: Colors.white,
        ),
      ),
    );
  }
}
