import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/bottom_sheet_2.dart';

class Career_Period extends StatefulWidget {
  const Career_Period({super.key});

  @override
  State<Career_Period> createState() => _Career_PeriodState();
}

class _Career_PeriodState extends State<Career_Period> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.read<Page_Controller>().select_info['career_type']![0] ==
                    '경력자입니다'
                ? '경력 기간'
                : '교육 기간',
            style: TextStyle(
              color: Color(0xFF020202),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Bottom_Modal_Sheet_2();
                },
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: context.read<Page_Controller>().period_save.isEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '선택해주세요',
                          style: TextStyle(
                            color: Color(0xFF020202),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SvgPicture.asset(
                            'assets/icons/Property 2=Outline, Property 3=chevron-down.svg'),
                      ],
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        '${context.read<Page_Controller>().period_save[0]}년 ${context.read<Page_Controller>().period_save[1]}개월',
                        style: TextStyle(
                          color: Color(0xFF020202),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
