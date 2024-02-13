import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

Future<void> LogProjectModalWidget(BuildContext context,
    {required Function(String, String, String, List<dynamic>, String)
        onAddProject}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: 328,
            child: LogProjectCustomDialog(
              onAddProject: (date, project, tag, picturelist, content) {
                onAddProject(date, project, tag, picturelist, content);
              },
            ), // 커스텀 다이얼로그 위젯 사용
          ),
        ),
      );
    },
  );
}

class LogProjectCustomDialog extends StatefulWidget {
  final Function(String, String, String, List<dynamic>, String) onAddProject;

  const LogProjectCustomDialog({super.key, required this.onAddProject});
  @override
  _LogProjectCustomDialogState createState() => _LogProjectCustomDialogState();
}

class _LogProjectCustomDialogState extends State<LogProjectCustomDialog> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController tagController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  List<dynamic> imageUrls = [];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        // 이미지가 선택되면 리스트에 추가
        imageUrls.add(pickedFile.path);
      });
    }
  }

  void onAddProject(String date, String project, String tag, List picturelist,
      String content) {
    widget.onAddProject(date, project, tag, picturelist, content);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: 328,
          height: 700,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '프로젝트',
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: '를 입력해주세요.',
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 11,
              ),
              Container(
                width: 280,
                height: 1,
                decoration: BoxDecoration(color: Color(0xFF020202)),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.only(left: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  '기간',
                  style: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 280,
                height: 48,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFFF3F3F3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: TextField(
                  controller: dateController,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: "0000년 0월 0일 ~ 0000년 0월 0일",
                    hintStyle: TextStyle(
                      color: Color(0xFF020202),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 7),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  '프로젝트명',
                  style: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 280,
                height: 48,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFFF3F3F3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: TextField(
                  controller: projectNameController,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: "프로젝트명에 대해 입력해주세요.",
                    hintStyle: TextStyle(
                      color: Color(0xFF020202),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 7),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  '태그 설정',
                  style: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 280,
                height: 48,
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFFF3F3F3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: TextField(
                  controller: tagController,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: "프로젝트에 관련된 태그를 입력해주세요.",
                    hintStyle: TextStyle(
                      color: Color(0xFF020202),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 7),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  '프로젝트 설명',
                  style: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 280,
                height: 216,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: ShapeDecoration(
                  color: Color(0xFFF3F3F3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 86, // 이미지 목록의 높이 조절
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // 수평으로 스크롤
                        itemCount: imageUrls.length < 5
                            ? imageUrls.length + 1
                            : imageUrls.length, // 이미지 개수 + 1(버튼을 위한)
                        itemBuilder: (context, index) {
                          if (index == 0 && imageUrls.length < 5) {
                            // 이미지 선택을 위한 버튼
                            return GestureDetector(
                              onTap: _pickImage,
                              child: Container(
                                width: 86,
                                height: 86,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFFE6E6E6)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/camera-filled.svg",
                                      width: 32,
                                      height: 32,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      '사진 첨부(${imageUrls.length}/5)',
                                      style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              width: 86,
                              height: 86,
                              margin: EdgeInsets.symmetric(horizontal: 6),
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: FileImage(File(imageUrls[
                                      index - (imageUrls.length < 5 ? 1 : 0)])),
                                  fit: BoxFit.cover,
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: Color(0xFFE6E6E6)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        imageUrls.removeAt(index -
                                            (imageUrls.length < 5 ? 1 : 0));
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      "assets/icons/x.svg",
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Container(
                      width: 244,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFE6E6E6),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      height: 66,
                      child: TextField(
                        controller: contentController,
                        maxLines: 6,
                        cursorHeight: 20,
                        textAlignVertical: TextAlignVertical.top,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                        //maxLength: 300,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: '프로젝트에 대한 설명을 작성해주세요.',
                          hintStyle: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                          hintMaxLines: 2,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 144,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF0059FF)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '취소',
                          textAlign: TextAlign.center,
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
                      FocusScope.of(context).unfocus();
                      onAddProject(
                          dateController.text,
                          projectNameController.text,
                          tagController.text,
                          imageUrls,
                          contentController.text);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 144,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: Color(0xFF0059FF),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF0059FF)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '적용',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
