import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/chatting/chatting_mold.dart';

class Chatting_Body extends StatefulWidget {
  final String type;
  const Chatting_Body(this.type);

  @override
  State<Chatting_Body> createState() => _Chatting_BodyState();
}

class _Chatting_BodyState extends State<Chatting_Body> {
  List<Map<String, dynamic>> project_chat = [
    {
      'title': '프로젝트 <choochoo> 단체방',
      'content': '새로운 기능을 배포하기 전에 QA를 위한 테스트 환경을 설정해야 하는데, 도움이 필요합니다. 지금 가능하신',
      'image': 'chatting04.png',
      'member': '8',
      'alarm': true,
      'time': '13:01',
      'new_chat': '81'
    },
    {
      'title': 'Meet Po. 단체방🔥',
      'content': '네 참고하겠습니다 😄😄 피그마에도 남겨놓겠습니다!',
      'image': 'chatting05.png',
      'member': '3',
      'alarm': false,
      'time': '1/19',
    },
    {
      'title': 'tombik',
      'content': '수고하셨습니다!',
      'image': 'chatting06.png',
      'member': '6',
      'alarm': true,
      'time': '1/14',
      'new_chat': '4'
    }
  ];
  List<Map<String, dynamic>> employment_chat = [
    {
      'title': '스타트업 newbold',
      'content': '지원이 완료되었습니다.',
      'image': 'chatting01.png',
      'alarm': true,
      'time': '9:01',
      'new_chat': '1'
    },
    {
      'title': '주식회사 EODYNE',
      'content': '담당자가 지원자의 서류를 확인했습니다.',
      'image': 'chatting02.png',
      'alarm': false,
      'time': '1/19',
    },
    {
      'title': 'IX 스튜디오',
      'content': '채용 결과가 발표되었습니다. 채용 결과 확인하러 가기',
      'image': 'chatting03.png',
      'alarm': true,
      'time': '1/14',
      'new_chat': '1'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 550,
      child: widget.type == 'project'
          ? Column(
              children: [
                for (var element in project_chat) Chatting_Mold(element)
              ],
            )
          : widget.type == 'employment'
              ? Column(
                  children: [
                    for (var element in employment_chat) Chatting_Mold(element)
                  ],
                )
              : Container(),
    );
  }
}
