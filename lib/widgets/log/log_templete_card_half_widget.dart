import 'package:flutter/material.dart';

class LogCardHalfWidget extends StatelessWidget {
  final String? id;
  final String? thumbnail;
  final String? title;
  final String? date;
  final String? tag;

  late String baseUrl =
      'http://3.36.50.35:8090/api/files/uu8n8wlr77yjuf7/${id}/';

  LogCardHalfWidget(
      {super.key, this.thumbnail, this.title, this.date, this.tag, this.id});

  @override
  Widget build(BuildContext context) {
    final fullImageUrl =
        '$baseUrl$thumbnail'; // baseUrl이 항상 존재하므로 null-aware 연산자 제거
    final List<String> tagList = tag?.split(' ') ?? [];

    return Container(
      width: 159,
      padding: const EdgeInsets.only(bottom: 8.83),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.74, color: Color(0xFFE6E6E6)),
          borderRadius: BorderRadius.circular(5.89),
        ),
      ),
      child: Column(
        children: [
          if (thumbnail == null)
            Container(
              width: 159,
              height: 100.25,
              alignment: Alignment.topLeft,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/log/templete-project.png"),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
              child: tag == null
                  ? Container(
                      margin: EdgeInsets.only(left: 8.83, top: 8.83),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          IntrinsicWidth(
                            child: Container(
                              margin: EdgeInsets.only(right: 6),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              height: 20,
                              decoration: BoxDecoration(
                                color: Color(0xFFE5EEFF),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                  child: Text(
                                "JAVA",
                                style: TextStyle(
                                  color: Color(0xFF0059FF),
                                  fontSize: 8,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),
                          ),
                          IntrinsicWidth(
                            child: Container(
                              margin: EdgeInsets.only(right: 6),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              height: 20,
                              decoration: BoxDecoration(
                                color: Color(0xFFE5EEFF),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                  child: Text(
                                "Python",
                                style: TextStyle(
                                  color: Color(0xFF0059FF),
                                  fontSize: 8,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(left: 8.83, top: 8.83),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          for (String tagText in tagList)
                            IntrinsicWidth(
                              child: Container(
                                margin: EdgeInsets.only(right: 6),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE5EEFF),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text(
                                    tagText,
                                    style: TextStyle(
                                      color: Color(0xFF0059FF),
                                      fontSize: 8,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
            ),
          if (thumbnail != null)
            Container(
              width: 159,
              height: 100.25,
              alignment: Alignment.topLeft,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(fullImageUrl),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
              child: tag == null
                  ? Container(
                      height: 15,
                      margin: EdgeInsets.only(left: 8.83, top: 8.83),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          IntrinsicWidth(
                            child: Container(
                              margin: EdgeInsets.only(right: 6),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              height: 20,
                              decoration: BoxDecoration(
                                color: Color(0xFFE5EEFF),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                  child: Text(
                                "JAVA",
                                style: TextStyle(
                                  color: Color(0xFF0059FF),
                                  fontSize: 8,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),
                          ),
                          IntrinsicWidth(
                            child: Container(
                              margin: EdgeInsets.only(right: 6),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              height: 20,
                              decoration: BoxDecoration(
                                color: Color(0xFFE5EEFF),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                  child: Text(
                                "Python",
                                style: TextStyle(
                                  color: Color(0xFF0059FF),
                                  fontSize: 8,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: 15,
                      margin: EdgeInsets.only(left: 8.83, top: 8.83),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          for (String tagText in tagList)
                            IntrinsicWidth(
                              child: Container(
                                margin: EdgeInsets.only(right: 6),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE5EEFF),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Text(
                                    tagText,
                                    style: TextStyle(
                                      color: Color(0xFF0059FF),
                                      fontSize: 8,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
            ),
          Container(
            padding: EdgeInsets.only(left: 11.05, right: 8.95, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    title == null ? 'Project 01' : title!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    date == null ? '기간' : date!,
                    style: TextStyle(
                      color: Color(0xFF020202),
                      fontSize: 10,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
