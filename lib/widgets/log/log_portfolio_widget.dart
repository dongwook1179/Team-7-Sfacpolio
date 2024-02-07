import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/tag_slot.dart';

class LogportfolioWidget extends StatelessWidget {
  const LogportfolioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '2023년 개발자 포폴',
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              SizedBox(
                width: 232,
                height: 37,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  '이번 코딩 강좌에서는 구글 애널리틱스가 무엇인지 살펴보고 웹사이트에 연결하는 방법을 알아볼게요. 디자인베이스 강좌는 맥을 기준으로 해서 윈도우 사용자와 일 부 차이가 있을 수 있습니다. 이번 코딩 강좌에서는 구글 애널리틱스가 무엇인지 살펴보고 웹사이트에 연결하는 방법을 알아볼게요. 디자인베이스 강좌는 맥을 기준으로 해서 윈도우 사용자와 일부 차이가 있을 수 있습니다.',
                  style: TextStyle(
                    color: Color(0xFF4C4C4C),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: ShapeDecoration(
                      color: Colors.grey,
                      shape: OvalBorder(),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'qwerd4578',
                    style: TextStyle(
                      color: Color(0xFF4C4C4C),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Container(
                height: 8,
              ),
              //20짜리는 태그 들어갈 공간
              Container(
                height: 20,
                child: Row(
                  children: [Tag_Slot("백엔드"), Tag_Slot("코딩"), Tag_Slot("JAVA")],
                ),
              ),
            ],
          ),
          Container(
            width: 72,
            height: 72,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          )
        ],
      ),
    );
  }
}
