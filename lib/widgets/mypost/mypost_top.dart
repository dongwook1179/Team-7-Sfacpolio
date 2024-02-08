import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class MyPost_Top extends StatefulWidget {
  final List<String> data_key;
  const MyPost_Top(this.data_key);

  @override
  State<MyPost_Top> createState() => _MyPost_TopState();
}

class _MyPost_TopState extends State<MyPost_Top> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: 360,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: context.watch<Page_Controller>().post_delete_active
            ? Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context
                          .read<Page_Controller>()
                          .Post_Delete_Select(widget.data_key);
                    },
                    child: Row(
                      children: [
                        Text(
                          '전체선택',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: context
                                            .watch<Page_Controller>()
                                            .post_delete_select
                                            .length ==
                                        widget.data_key.length
                                    ? Color(0xff000000)
                                    : Color(0xFFE6E6E6),
                              ),
                              shape: BoxShape.circle),
                          child: Center(
                              child: SvgPicture.asset(
                            'assets/icons/check.svg',
                            width: 15,
                            height: 15,
                            color: context
                                        .watch<Page_Controller>()
                                        .post_delete_select
                                        .length ==
                                    widget.data_key.length
                                ? Color(0xff000000)
                                : Color(0xFFE6E6E6),
                          )),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Provider.of<Page_Controller>(context, listen: false)
                          .Post_Delete_Active();
                    },
                    child: Text(
                      '완료',
                      style: TextStyle(
                        color: Color(0xFF0059FF),
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      '삭제',
                      style: TextStyle(
                        color: context
                                    .watch<Page_Controller>()
                                    .post_delete_select
                                    .length >
                                0
                            ? Color(0xff000000)
                            : Color(0xFFCCCCCC),
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              )
            : Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/filter.svg',
                    color: Color(0xff000000),
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${widget.data_key.length}개',
                    style: TextStyle(
                      color: Color(0xFF0059FF),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '의 게시글',
                    style: TextStyle(
                      color: Color(0xFF020202),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.read<Page_Controller>().Post_Delete_Active();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/trash.svg',
                      width: 21,
                      height: 21,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
