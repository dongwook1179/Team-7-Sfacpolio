import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/mycomment/mycomment_slot.dart';

class MyComment_Body extends StatefulWidget {
  final Map<String, dynamic> data;
  const MyComment_Body(this.data);

  @override
  State<MyComment_Body> createState() => _MyComment_BodyState();
}

class _MyComment_BodyState extends State<MyComment_Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Page_Controller>(builder: (context, pageController, _) {
      return Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (String text in widget.data.keys)
                MyComment_Slot_Build(widget.data[text])
            ],
          ),
        ),
      );
    });
  }
}
