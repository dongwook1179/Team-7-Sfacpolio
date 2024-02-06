import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/follow/follow_mold.dart';

class Follow_Body extends StatefulWidget {
  final String type;
  const Follow_Body(this.type);

  @override
  State<Follow_Body> createState() => _Follow_BodyState();
}

class _Follow_BodyState extends State<Follow_Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Page_Controller>(
      builder: (context, pageController, _) {
        return Container(
          width: 360,
          height: 520,
          padding: EdgeInsets.only(top: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int index = 0;
                    index <
                        context
                            .read<Page_Controller>()
                            .follow_data[widget.type]
                            .length;
                    index++)
                  Follow_Mold(widget.type, index)
              ],
            ),
          ),
        );
      },
    );
  }
}
