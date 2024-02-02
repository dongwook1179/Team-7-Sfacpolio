import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Chatting_Mold extends StatefulWidget {
  final Map<String, dynamic> chatting;

  const Chatting_Mold(this.chatting);

  @override
  State<Chatting_Mold> createState() => _Chatting_MoldState();
}

class _Chatting_MoldState extends State<Chatting_Mold> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.chatting);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.only(top: 24),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/chatting/${widget.chatting['image']}'),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 268,
              height: 17,
              child: Row(
                children: [
                  Text(
                    widget.chatting['title']!,
                    style: TextStyle(
                      color: Color(0xFF020202),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  widget.chatting.containsKey('member')
                      ? SizedBox(
                          width: 6,
                        )
                      : SizedBox(),
                  widget.chatting.containsKey('member')
                      ? Text(
                          widget.chatting['member'],
                          style: TextStyle(
                            color: Color(0xFFB3B3B3),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : SizedBox(),
                  SizedBox(
                    width: 6,
                  ),
                  widget.chatting['alarm']
                      ? SvgPicture.asset('assets/icons/non_bell.svg')
                      : Container(),
                  Expanded(
                      child: Text(
                    widget.chatting['time'],
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ))
                ],
              ),
            ),
            Container(
              width: 268,
              height: 36,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.chatting['content'],
                      style: TextStyle(
                        color: Color(0xFF4C4C4C),
                        fontSize: 13,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  widget.chatting.containsKey('new_chat')
                      ? Center(
                          child: IntrinsicWidth(
                            child: Container(
                              height: 20,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color(0xFF0059FF)),
                              child: Center(
                                child: Text(
                                  widget.chatting['new_chat'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 23,
                          height: 20,
                        )
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
