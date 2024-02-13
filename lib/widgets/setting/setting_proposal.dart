import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Setting_Proposal extends StatefulWidget {
  const Setting_Proposal({super.key});

  @override
  State<Setting_Proposal> createState() => _Setting_ProposalState();
}

class _Setting_ProposalState extends State<Setting_Proposal> {
  bool page_open = false;
  Map<String, bool> proposal_state = {
    '채용 제안 받기': false,
    '의견 제안 받기': false,
    '프로젝트 제안 받기': false,
  };
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: 360,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  page_open = !page_open;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Color(0xFFE6E6E6)))),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                height: 56,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Text(
                      '제안 설정',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    page_open
                        ? SvgPicture.asset(
                            'assets/icons/chevron-up.svg',
                            width: 16,
                            height: 16,
                          )
                        : SvgPicture.asset(
                            'assets/icons/chevron-down.svg',
                            width: 16,
                            height: 16,
                          ),
                    SizedBox(
                      width: 8,
                    )
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 150),
              height: page_open ? 48 * proposal_state.length.toDouble() : 0,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (String key in proposal_state.keys)
                      Container(
                        width: 316,
                        height: 48,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.symmetric(vertical: 1),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              key,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Switch(
                              value: proposal_state[key]!,
                              activeColor: Color(0xffFFFFFF),
                              activeTrackColor: Color(0xff0059FF),
                              inactiveThumbColor: Color(0xffFFFFFF),
                              inactiveTrackColor: Color(0xffE6E6E6),
                              trackOutlineColor:
                                  MaterialStateProperty.resolveWith(
                                (final Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Color(0xff0059FF);
                                  }
                                  return Color(0xffE6E6E6);
                                },
                              ),
                              onChanged: (value) {
                                setState(() {
                                  proposal_state[key] = value;
                                });
                              },
                            )
                          ],
                        ),
                      )
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
