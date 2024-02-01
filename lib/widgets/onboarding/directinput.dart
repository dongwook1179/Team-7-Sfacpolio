import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/languageinputfield.dart';

class Direct_Input extends StatefulWidget {
  const Direct_Input({super.key});

  @override
  State<Direct_Input> createState() => _Direct_InputState();
}

class _Direct_InputState extends State<Direct_Input> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<Page_Controller>().Input_Text('');

        Navigator.of(context).pop();
      },
      child: Container(
        width: 360,
        height: 740,
        decoration: BoxDecoration(color: Color(0xFF000000).withOpacity(0.3)),
        child: Center(
            child: Container(
          width: 328,
          height: 225,
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '사용하시는 ',
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '개발 언어를 ',
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '입력해주세요 ',
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                margin: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
              Language_InputField(),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<Page_Controller>().Input_Text('');
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 145,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFFFFFFF),
                          border:
                              Border.all(width: 1, color: Color(0xFF0059FF))),
                      child: Center(
                        child: Text(
                          '취소',
                          style: TextStyle(
                            color: Color(0xFF0059FF),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 145,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFF0059FF),
                      ),
                      child: Center(
                        child: Text(
                          '적용',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
