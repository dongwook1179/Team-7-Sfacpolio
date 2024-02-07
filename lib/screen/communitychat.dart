import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommunityChat extends StatefulWidget {
  const CommunityChat({super.key});

  @override
  State<CommunityChat> createState() => _CommunityChatState();
}

class _CommunityChatState extends State<CommunityChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.navigate_before),
        ),
        centerTitle: true,
        title: Text(
          '커뮤니티',
          style: TextStyle(
            color: Color(0xFF020202),
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
            height: 0.09,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              child: Image.asset(
                                'assets/images/service/profile01.png',
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'NewCoreder312',
                              style: TextStyle(
                                color: Color(0xFF020202),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              '• 프론트엔드',
                              style: TextStyle(
                                color: Color(0xFF999999),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 85,
                            ),
                            Container(
                              width: 53,
                              height: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF0059FF),
                              ),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'follow',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 0.4,
                                    ),
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '혼자 프로젝트하다가 질문있습니다.',
                          style: TextStyle(
                            color: Color(0xFF020202),
                            fontSize: 18,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '안녕하세요, 혼자 프로젝트를 진행하던 중에 도움이 필요한 부분이 있어 질문드립니다. 제 코드에서 발생하는 이슈를 해결하거나, 개선 아이디어를 공유해주실 수 있는 분들이 계신가요? 감사합니다!',
                          style: TextStyle(
                            color: Color(0xFF020202),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                    'assets/images/chatting/image 232.png')),
                            SizedBox(
                              width: 8,
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                    'assets/images/chatting/image 2.png')),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 30,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Color(0xFFCDFFD5)),
                              child: Text(
                                '질문',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF069A65),
                                    fontSize: 11,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    height: 1.8),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                              width: 39,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0xFFE5EEFF),
                              ),
                              child: Text(
                                '백엔드',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF0059FF),
                                    fontSize: 11,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    height: 1.8),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                              width: 39,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0xFFE5EEFF),
                              ),
                              child: Text(
                                'Kotlin',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF0059FF),
                                    fontSize: 11,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    height: 1.8),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                              width: 39,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0xFFE5EEFF),
                              ),
                              child: Text(
                                'JAVA',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF0059FF),
                                    fontSize: 11,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    height: 1.8),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Container(
                                width: 16,
                                height: 16,
                                child:
                                    SvgPicture.asset('assets/icon/heart.svg')),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              '12',
                              style: TextStyle(
                                color: Color(0xFF7F7F7F),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                              ),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Container(
                                width: 16,
                                height: 16,
                                child: SvgPicture.asset(
                                    'assets/icons/chat-alt.svg')),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              '2',
                              style: TextStyle(
                                color: Color(0xFF7F7F7F),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                              ),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Container(
                                width: 16,
                                height: 16,
                                child:
                                    SvgPicture.asset('assets/icons/eye.svg')),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              '300',
                              style: TextStyle(
                                color: Color(0xFF7F7F7F),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                              ),
                            ),
                            SizedBox(
                              width: 166,
                            ),
                            Text(
                              '3시간전',
                              style: TextStyle(
                                color: Color(0xFFB3B3B3),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 360,
                          height: 1,
                          decoration: BoxDecoration(color: Color(0xFFEBEBEB)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '댓글 2',
                          style: TextStyle(
                            color: Color(0xFF020202),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              '등록순',
                              style: TextStyle(
                                color: Color(0xFFB3B3B3),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text('최신순',
                                style: TextStyle(
                                  color: Color(0xFF020202),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 0.12,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              child: Image.asset(
                                'assets/images/service/profile01.png',
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'NewCoreder312',
                              style: TextStyle(
                                color: Color(0xFF020202),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text('• 작성자',
                                style: TextStyle(
                                  color: Color(0xFF0059FF),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                )),
                            SizedBox(
                              width: 143,
                            ),
                            SvgPicture.asset(
                              'assets/icon/dots-vertical.svg',
                              color: Color(0xFF7F7F7F),
                              width: 17,
                              height: 17,
                            )
                          ],
                        ),
                        Text(
                          '며칠째 해결 못하고 있어요.. 도와주세요 ㅠㅜ',
                          style: TextStyle(
                            color: Color(0xFF020202),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                  width: 16,
                                  height: 16,
                                  child: SvgPicture.asset(
                                      'assets/icon/heart.svg')),
                              SizedBox(
                                width: 12,
                              ),
                              Container(
                                  width: 16,
                                  height: 16,
                                  child: SvgPicture.asset(
                                      'assets/icons/chat-alt.svg')),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                  color: Color(0xFF7F7F7F),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                child: Image.asset(
                                  'assets/images/service/profile01.png',
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                'rhdiddl',
                                style: TextStyle(
                                  color: Color(0xFF020202),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                '• 백엔드',
                                style: TextStyle(
                                  color: Color(0xFFB3B3B3),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 160,
                              ),
                              SvgPicture.asset(
                                'assets/icon/dots-vertical.svg',
                                color: Color(0xFF7F7F7F),
                                width: 17,
                                height: 17,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            '제가 도와드릴게요. 채팅으로 오픈카톡 드렸어요',
                            style: TextStyle(
                              color: Color(0xFF020202),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            children: [
                              Container(
                                  width: 16,
                                  height: 16,
                                  child: SvgPicture.asset(
                                      'assets/icon/heart.svg')),
                              SizedBox(
                                width: 12,
                              ),
                              Container(
                                  width: 16,
                                  height: 16,
                                  child: SvgPicture.asset(
                                      'assets/icons/chat-alt.svg')),
                              SizedBox(
                                width: 3,
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          Container(
              width: 360,
              height: 60,
              color: Colors.white,
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color(0xFFF8F8F9),
                      width: 10,
                    )),
                    hintText: '댓글을 입력해주세요',
                    hintStyle: TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: Container(
                      width: 40,
                      height: 40,
                      child: SvgPicture.asset(
                        'assets/icon/send.svg',
                      ),
                    )),
              )),
        ],
      ),
    );
  }
}
