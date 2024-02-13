import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditDropDown extends StatefulWidget {
  const EditDropDown({super.key});

  @override
  State<EditDropDown> createState() => _EditDropDownState();
}

class _EditDropDownState extends State<EditDropDown> {
  Color _onlineColor = Color(0xFFB3B3B3);
  Color _offlineColor = Color(0xFFB3B3B3);

  void _changeTextColor() {
    setState(() {
      _offlineColor = _offlineColor == Color(0xFF0059FF)
          ? Color(0xFFB3B3B3)
          : Color(0xFF0059FF);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'MBTI',
            style: TextStyle(
              color: Color(0xFF020202),
              fontSize: 16,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 328,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFCCCCCC)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'ISTJ',
                  hintStyle: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsets.all(13),
                  suffixIcon: Icon(
                    Icons.expand_more,
                  )),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Text(
                '경력 사항',
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 249,
              ),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/plus.svg',
                  color: Color(0xFF0059FF),
                  width: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                width: 183,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFCCCCCC)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '직장',
                      hintStyle: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 14.0,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.all(13),
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.expand_more,
                        ),
                      )),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Container(
                width: 83,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFCCCCCC)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '2개월',
                      hintStyle: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.all(13),
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.expand_more,
                        ),
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 272,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFCCCCCC)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '와이엠에스닷코',
                  hintStyle: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsets.all(13),
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.expand_more,
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                width: 183,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFCCCCCC)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '교육',
                      hintStyle: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.all(13),
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.expand_more,
                        ),
                      )),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Container(
                width: 83,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFCCCCCC)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '4개월',
                      hintStyle: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.all(13),
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.expand_more,
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                width: 272,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFCCCCCC)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '웅진 프로젝트',
                      hintStyle: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: EdgeInsets.all(13),
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.expand_more,
                        ),
                      )),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 52,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF0059FF)),
                  child: Center(
                    child: Text(
                      '삭제',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0.11,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            '프로젝트 선호 조건',
            style: TextStyle(
              color: Color(0xFF020202),
              fontSize: 16,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _onlineColor = _onlineColor == Color(0xFF0059FF)
                        ? Color(0xFFB3B3B3)
                        : Color(0xFF0059FF);
                  });
                },
                child: Container(
                  width: 161,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFB3B3B3)),
                  ),
                  child: Center(
                    child: Text(
                      '온라인',
                      style: TextStyle(
                        color: Color(0xFF7F7F7F),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _offlineColor = _offlineColor == Color(0xFF0059FF)
                        ? Color(0xFFB3B3B3)
                        : Color(0xFF0059FF);
                  });
                },
                child: Container(
                  width: 161,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFB3B3B3)),
                  ),
                  child: Center(
                    child: Text(
                      '오프라인',
                      style: TextStyle(
                        color: Color(0xFF7F7F7F),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: 328,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFCCCCCC)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '6~9개월',
                  hintStyle: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsets.all(7),
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.expand_more,
                    ),
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
