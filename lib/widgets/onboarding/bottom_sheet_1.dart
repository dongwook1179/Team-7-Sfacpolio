import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Bottom_Modal_Sheet_1 extends StatefulWidget {
  final String type;
  final Map<String, Widget> widgets;
  const Bottom_Modal_Sheet_1(this.type, this.widgets);

  @override
  State<Bottom_Modal_Sheet_1> createState() => _Bottom_Modal_Sheet_1State();
}

class _Bottom_Modal_Sheet_1State extends State<Bottom_Modal_Sheet_1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Page_Controller>(
      builder: (context, pageController, _) {
        return Container(
          width: 360,
          height: 330,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 32,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFFCCCCCC),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                        'assets/icons/Property 2=Outline, Property 3=chevron-down.svg'),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        widget.type == 'language' ? '주로 사용하는 언어' : '내가 선택한 업종',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Expanded(
                child: Wrap(
                  children: widget.widgets.values.toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
