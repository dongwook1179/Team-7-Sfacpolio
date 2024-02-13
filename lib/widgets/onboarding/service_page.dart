import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/selectslot_2.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/service_slot.dart';

class Service_Page extends StatefulWidget {
  const Service_Page({super.key});

  @override
  State<Service_Page> createState() => _Service_PageState();
}

class _Service_PageState extends State<Service_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 504,
      child: Column(
        children: [Service_Slot(), Select_Slot_2()],
      ),
    );
  }
}
