import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/widgets/tag_slot.dart';

class Community_Slot_Build extends StatefulWidget {
  final dynamic data;
  const Community_Slot_Build(this.data);

  @override
  State<Community_Slot_Build> createState() => _Community_Slot_BuildState();
}

class _Community_Slot_BuildState extends State<Community_Slot_Build> {
  String date = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Date_Division();
  }

  void Date_Division() {
    DateTime dateTime = DateTime.parse(widget.data['update']);
    String formattedDate =
        "${dateTime.year}.${_twoDigits(dateTime.month)}.${_twoDigits(dateTime.day)}";

    if (widget.data['image'].runtimeType == List) {
      setState(() {
        widget.data['image'] = widget.data['image'][0];
      });
    }

    setState(() {
      date = formattedDate;
    });
  }

  String _twoDigits(int n) {
    if (n >= 10) {
      return "$n";
    } else {
      return "0$n";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: 291,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: Color(0xFFE6E6E6),
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 190,
            padding: EdgeInsets.only(top: 12, left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              image: DecorationImage(
                  image: NetworkImage(widget.data['image']), fit: BoxFit.cover),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.data['develop_type'].isNotEmpty
                    ? Tag_Slot(widget.data['develop_type'][0])
                    : Container(),
                widget.data['language'].isNotEmpty
                    ? Tag_Slot(widget.data['language'][0])
                    : Container(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data['title'],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: Color(0xFF7F7F7F),
                    fontSize: 11,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      padding: EdgeInsets.only(left: 11),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(widget.data['avatar']),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      widget.data['writer'],
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      'assets/icons/like.svg',
                      width: 16,
                      height: 16,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      '${widget.data['like_num']}',
                      style: TextStyle(
                        color: Color(0xFF7F7F7F),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/icons/comment.svg',
                      width: 16,
                      height: 16,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      '${widget.data['comment_num']}',
                      style: TextStyle(
                        color: Color(0xFF7F7F7F),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/icons/view.svg',
                      width: 16,
                      height: 16,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      '${widget.data['view_num']}',
                      style: TextStyle(
                        color: Color(0xFF7F7F7F),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    )
        // IntrinsicHeight(
        //   child: Container(
        //     width: 360,
        //     padding: EdgeInsets.only(top: 16, bottom: 17),
        //     child: Column(
        //       children: [
        //         Container(
        //           margin: EdgeInsets.only(left: 16),
        //           child: Column(
        //             children: [
        //               Row(
        //                 children: [
        //                   for (String text in widget.data['develop_type'])
        //                     Tag_Slot(text),
        //                   for (String text in widget.data['language'])
        //                     Tag_Slot(text),
        //                 ],
        //               ),
        //               SizedBox(
        //                 height: 16,
        //               ),
        //               Text(
        //                 widget.data['title'],
        //                 style: TextStyle(
        //                   color: Color(0xFF020202),
        //                   fontSize: 14,
        //                   fontFamily: 'Pretendard',
        //                   fontWeight: FontWeight.w700,
        //                 ),
        //               ),
        //               SizedBox(
        //                 height: 5,
        //               ),
        //               Text(
        //                 widget.data['content'],
        //                 style: TextStyle(
        //                   color: Color(0xFF4C4C4C),
        //                   fontSize: 12,
        //                   fontFamily: 'Pretendard',
        //                   fontWeight: FontWeight.w400,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           height: 16,
        //         ),
        //         SingleChildScrollView(
        //           scrollDirection: Axis.horizontal,
        //           child: Row(
        //             children: [
        //               for (String url in widget.data['image'])
        //                 Container(
        //                   width: 198,
        //                   height: 167,
        //                   margin: EdgeInsets.only(),
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.only(
        //                       topLeft: Radius.circular(8),
        //                       topRight: Radius.circular(8),
        //                     ),
        //                     image: DecorationImage(
        //                         image: NetworkImage(url), fit: BoxFit.cover),
        //                   ),
        //                 )
        //             ],
        //           ),
        //         ),
        //         Row(
        //           children: [
        //             Container(
        //               width: 24,
        //               height: 24,
        //               padding: EdgeInsets.only(left: 11),
        //               decoration: BoxDecoration(
        //                   shape: BoxShape.circle,
        //                   image: DecorationImage(
        //                       image: NetworkImage(widget.data['avatar']),
        //                       fit: BoxFit.cover)),
        //             ),
        //             SizedBox(
        //               width: 6,
        //             ),
        //             Text(
        //               widget.data['nickname'],
        //               style: TextStyle(
        //                 color: Color(0xFF020202),
        //                 fontSize: 12,
        //                 fontFamily: 'Pretendard',
        //                 fontWeight: FontWeight.w400,
        //               ),
        //             ),
        //             Spacer(),
        //             SvgPicture.asset(
        //               'assets/icons/like.svg',
        //               width: 16,
        //               height: 16,
        //             ),
        //             SizedBox(
        //               width: 2,
        //             ),
        //             Text(
        //               '${widget.data['like'].length}',
        //               style: TextStyle(
        //                 color: Color(0xFF7F7F7F),
        //                 fontSize: 12,
        //                 fontFamily: 'Pretendard',
        //                 fontWeight: FontWeight.w400,
        //               ),
        //             ),
        //             SizedBox(
        //               width: 10,
        //             ),
        //             SvgPicture.asset(
        //               'assets/icons/comment.svg',
        //               width: 16,
        //               height: 16,
        //             ),
        //             SizedBox(
        //               width: 2,
        //             ),
        //             Text(
        //               '${widget.data['comment'].length}',
        //               style: TextStyle(
        //                 color: Color(0xFF7F7F7F),
        //                 fontSize: 12,
        //                 fontFamily: 'Pretendard',
        //                 fontWeight: FontWeight.w400,
        //               ),
        //             ),
        //             SizedBox(
        //               width: 10,
        //             ),
        //             SvgPicture.asset(
        //               'assets/icons/view.svg',
        //               width: 16,
        //               height: 16,
        //             ),
        //             SizedBox(
        //               width: 2,
        //             ),
        //             Text(
        //               '${widget.data['view'].length}',
        //               style: TextStyle(
        //                 color: Color(0xFF7F7F7F),
        //                 fontSize: 12,
        //                 fontFamily: 'Pretendard',
        //                 fontWeight: FontWeight.w400,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
