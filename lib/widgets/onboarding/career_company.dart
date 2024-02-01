import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Career_Company extends StatefulWidget {
  const Career_Company({super.key});

  @override
  State<Career_Company> createState() => _Career_CompanyState();
}

class _Career_CompanyState extends State<Career_Company> {
  TextEditingController company = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntrinsicHeight(
        child: Container(
          width: 360,
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context
                            .read<Page_Controller>()
                            .select_info['career_type']![0] ==
                        '경력자입니다'
                    ? '회사명'
                    : '교육 과정',
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  onChanged: (text) {
                    context
                        .read<Page_Controller>()
                        .select_info['career_company'] = [];
                    context
                        .read<Page_Controller>()
                        .Add_Information('career_company', text);
                  },
                  style: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: context
                                  .read<Page_Controller>()
                                  .select_info['career_type']![0] ==
                              '경력자입니다'
                          ? '회사명을 작성해주세요'
                          : '전공/과정을 입력해주세요',
                      hintStyle: TextStyle(
                        color: Color(0xFF4C4C4C),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
