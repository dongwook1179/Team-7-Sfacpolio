import 'package:flutter/material.dart';

Future<void> LogCareerModalWidget(BuildContext context,
    {required Function(String, String) onAddExperience,
    required Function(String, String) onEditExperience,
    required String initialDate,
    required String initialProject,
    bool isEditing = false}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: 328,
            child: LogCareerCustomDialog(
              onAddExperience: onAddExperience,
              onEditExperience: onEditExperience,
              isEditing: isEditing,
              initialProject: initialProject,
              initialDate: initialDate,
            ), // 커스텀 다이얼로그 위젯 사용
          ),
        ),
      );
    },
  );
}

class LogCareerCustomDialog extends StatefulWidget {
  final Function(String, String) onAddExperience;
  final Function(String, String) onEditExperience;
  final bool isEditing;
  final String initialProject;
  final String initialDate;

  LogCareerCustomDialog({
    required this.onAddExperience,
    required this.onEditExperience,
    required this.isEditing,
    required this.initialProject,
    required this.initialDate,
  });

  @override
  _LogCareerCustomDialogState createState() => _LogCareerCustomDialogState();
}

class _LogCareerCustomDialogState extends State<LogCareerCustomDialog> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController projectController = TextEditingController();
  late bool isEditing;

  @override
  void initState() {
    super.initState();
    isEditing = widget.isEditing;
    if (isEditing) {
      dateController.text = widget.initialDate;
      projectController.text = widget.initialProject;
    }
  }

  void onAddExperience(String date, String project) {
    widget.onAddExperience(date, project);
    FocusScope.of(context).unfocus();
  }

  void onEditExperience(String date, String project) {
    widget.onEditExperience(date, project);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: 328,
        height: 341,
        margin: EdgeInsets.all(0.0),
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
                    text: '경험 사항',
                    style: TextStyle(
                      color: Color(0xFF020202),
                      fontSize: 18,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '을 입력해주세요.',
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
              height: 12,
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
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 8),
              child: Text(
                '수상/프로젝트명',
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
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Color(0xFFF3F3F3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: TextField(
                controller: projectController,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  hintText: "수상 또는 프로젝트명에 대해 입력해주세요.",
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
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
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
                  hintText: "0000년0월0일 ~ 0000년0월0일",
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
                    if (isEditing) {
                      String updatedDate = dateController.text;
                      String updatedProject = projectController.text;
                      // 추가 모드일 때는 onAddExperience 함수 호출
                      onEditExperience(updatedDate, updatedProject);
                      print("${updatedDate} + ${updatedProject}");
                    } else {
                      String selectedDate = dateController.text;
                      String selectedProject = projectController.text;
                      // 수정 모드일 때는 onEditExperience 함수 호출

                      onAddExperience(selectedDate, selectedProject);
                      print("${selectedDate} * ${selectedProject}");
                    }
                    FocusScope.of(context).unfocus();
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
                        isEditing ? '수정' : '적용',
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
    );
  }
}
