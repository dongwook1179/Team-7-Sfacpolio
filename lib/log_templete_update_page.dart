import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/log_update_complete_page.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/log/log_career_card_widget.dart';
import 'package:team_7_sfacpolio/widgets/log/log_career_modal_widget.dart';
import 'package:team_7_sfacpolio/widgets/log/log_project_modal_widget.dart';

class LogTempleteUpdatePage extends StatefulWidget {
  final String? careerDate;
  final String? careerProject;
  final String? projectDate;
  final String? projectName;
  final String? projectTag;
  final List? projectPicturelist;
  final String? projectContent;

  LogTempleteUpdatePage({
    Key? key,
    this.careerDate,
    this.careerProject,
    this.projectDate,
    this.projectName,
    this.projectTag,
    this.projectPicturelist,
    this.projectContent,
  }) : super(key: key);

  @override
  State<LogTempleteUpdatePage> createState() => _LogTempleteUpdatePageState();
}

class _LogTempleteUpdatePageState extends State<LogTempleteUpdatePage> {
  late File _image;
  String careerdate = "";
  String careerproject = "";
  String projectdate = "";
  String projectname = "";
  String projecttag = "";
  List projectpicturelist = [];
  String projectcontent = "";

  List<Experience> experiences = [];
  List<Project> projects = [];
  bool showsns = false;
  late ResultList<RecordModel> snsList;
  final pb = PocketBase('http://3.36.50.35:8090');
  Map<String, bool> snsCheckedMap = {};
  String logId = "";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> fetchSnsData(String user_id) async {
    try {
      final snsList = await pb.collection('sns').getList(
            filter: "user_id ='$user_id'",
          );
      for (var item in snsList.items) {
        print("${item.data['account']}");
      }
      setState(() {
        this.snsList = snsList; // 이 부분을 추가
      });
      print(context.read<User_Data>().record);
    } catch (error) {
      // 에러 처리
      print('Error fetching SNS data: $error');
      // 빈 리스트를 반환하거나 다른 기본 값으로 처리
      setState(() {
        this.snsList = ResultList<RecordModel>(
            page: 1, perPage: 30, totalItems: 0, totalPages: 0, items: []);
      });
    }
  }

  Future<void> createLog() async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://3.36.50.35:8090/api/collections/log/records'), // API 엔드포인트 주소로 변경
      );

      // Add regular fields
      request.fields['user_id'] =
          "${context.read<User_Data>().record.record!.id}";
      request.fields['type'] = '포트폴리오';
      request.fields['title'] = 'title';
      request.fields['content'] = contentController.text;
      request.fields['email'] = emailController.text;
      request.fields['phone'] = phoneController.text;
      request.fields['name'] = nameController.text;

      // Add career, mywork, mysns
      request.fields['mycareer'] = jsonEncode(
          experiences.map((experience) => experience.toJson()).toList());
      request.fields['mywork'] =
          jsonEncode(projects.map((project) => project.toJson()).toList());
      request.fields['mysns'] = jsonEncode(snsCheckedMap.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList());
      print("image = ${_image.path}");
      // Add avatar as MultipartFile
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        _image.path,
      ));
      var response = await request.send();

      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> responseJson = json.decode(responseBody);
      String log_id = responseJson['id'];
      String logId = log_id;
      print("로그아이디 : $logId");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LogUpdateCompletePage(logId: log_id),
        ),
      );
      if (response.statusCode == 200) {
        print('Log created successfully');
      } else {
        print('Failed to create log. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating user data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _image = File("");
    careerdate = widget.careerDate ?? "";
    careerproject = widget.careerProject ?? "";
    snsList = ResultList<RecordModel>(
        page: 1, perPage: 30, totalItems: 0, totalPages: 0, items: []);
    for (var item in snsList.items) {
      snsCheckedMap[item.data['account']] = false;
    }
  }

  void addExperience(String date, String project) {
    if (date.isNotEmpty && project.isNotEmpty) {
      setState(() {
        experiences.add(Experience(date: date, project: project));
        print(experiences);
      });
    }
  }

  void EditExperience(String date, String project, int index) {
    if (date.isNotEmpty && project.isNotEmpty) {
      setState(() {
        experiences[index] = Experience(date: date, project: project);
        print(experiences);
      });
    }
  }

  void deleteExperience(int index) {
    setState(() {
      experiences.removeAt(index);
      print(experiences);
    });
  }

  void addProject(String date, String projectname, String tag, List picturelist,
      String content) {
    if (date.isNotEmpty && projectname.isNotEmpty) {
      String formattedDate = formatDateStringRange(date);
      setState(() {
        projects.add(Project(
            date: formattedDate,
            projectname: projectname,
            tag: tag,
            picturelist: picturelist,
            content: content));
      });
      print('Data received in addProject:');
      print('Date: $date');
      print('Dateformat: $formattedDate');
      print('Project Name: $projectname');
      print('Tag: $tag');
      print('Picture List: $picturelist');
      print('Content: $content');
      print('cc: ${projects}');
    }
  }

  String formatDateStringRange(String dateRangeString) {
    List<String> dateParts = dateRangeString.split(' ~ ');
    print(dateParts);

    if (dateParts.length != 2) {
      print('Error: Unable to split date range string');
      print('Original String: $dateRangeString');
      print('Split Parts: $dateParts');
      return ''; // 형식화된 날짜를 반환할 수 없는 경우 빈 문자열 또는 다른 기본값을 반환할 수 있습니다.
    }

    // 각 날짜를 형식화
    String formattedStartDate = formatDateString(dateParts[0]);
    String formattedEndDate = formatDateString(dateParts[1]);
    print(formattedStartDate);
    print(formattedEndDate);
    // 형식화된 날짜를 합쳐서 반환
    return '$formattedStartDate ~ $formattedEndDate';
  }

  String formatDateString(String dateString) {
    // "년 월 일"을 공백을 기준으로 분리
    List<String> dateWords = dateString.split(' ');

    // '년', '월', '일'을 제거하고 날짜를 "yyyy.MM.dd" 형식으로 변환
    String formattedDate = dateWords[0].replaceAll('년', '') +
        '.' +
        dateWords[1].replaceAll('월', '') +
        '.' +
        dateWords[2].replaceAll('일', '');

    return formattedDate;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        print(_image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          titleSpacing: 0.0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              size: 16,
            ),
          ),
          title: Text(
            '템플릿 수정하기',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF020202),
              fontSize: 16,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              height: 0.09,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 11,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Profile ',
                  style: TextStyle(
                    color: Color(0xFF0059FF),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '이름',
                  style: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: 328,
                height: 42,
                margin: EdgeInsets.symmetric(horizontal: 16),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: TextField(
                  controller: nameController,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: '이름을 입력해주세요.',
                    hintStyle: TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: EdgeInsets.all(12),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '소개글',
                  style: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: 328,
                height: 129,
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(12),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _pickImage();
                      },
                      child: Container(
                        width: 101,
                        height: 104,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFFE6E6E6)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          image: _image.existsSync()
                              ? DecorationImage(
                                  image: FileImage(_image),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: _image.existsSync()
                            ? null
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/camera-filled.svg",
                                    width: 32,
                                    height: 32,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '프로필 사진 첨부',
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
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 191,
                      height: 105,
                      padding: EdgeInsets.zero,
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
                          hintText: '나를 소개하는 내용을 300자 이내로 \n간단하게 작성해주세요.',
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
                height: 19,
              ),
              //spacer
              Container(
                height: 8,
                color: Color(0xFFF3F3F3),
              ),
              SizedBox(
                height: 11,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'About Me',
                  style: TextStyle(
                    color: Color(0xFF0059FF),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '경험사항',
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        LogCareerModalWidget(
                          context,
                          onAddExperience: (date, project) {
                            addExperience(date, project);
                          },
                          onEditExperience: (date, project) {
                            // 빈 함수 또는 다른 로직을 수행할 수 있음
                          },
                          initialDate: '',
                          initialProject: '',
                        );
                      },
                      child: Container(
                        width: 48,
                        height: 24,
                        decoration: ShapeDecoration(
                          color: Color(0xFF0059FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/plus-sm.svg",
                              color: Colors.white,
                              height: 10,
                              width: 10,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              '추가',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              experiences.isEmpty
                  ? Container(
                      width: 328,
                      height: 78,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(12),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: SizedBox(
                        width: 126,
                        child: Center(
                          child: Text(
                            '나의 경력을 추가해주세요.',
                            style: TextStyle(
                              color: Color(0xFF4C4C4C),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: experiences.asMap().entries.map((entry) {
                        final int index = entry.key;
                        final Experience experience = entry.value;
                        return LogCareerCardWidget(
                          careerdate: experience.date,
                          careerproject: experience.project,
                          onDelete: () => deleteExperience(index),
                          onEdit: () {
                            LogCareerModalWidget(
                              isEditing: true,
                              context,
                              onAddExperience: (date, project) {},
                              onEditExperience: (updatedDate, updatedProject) {
                                setState(() {
                                  EditExperience(
                                      updatedDate, updatedProject, index);
                                });
                              },
                              initialDate: experiences[index].date,
                              initialProject: experiences[index].project,
                            );
                          },
                        );
                      }).toList(),
                    ),
              SizedBox(
                height: 11,
              ),
              //spacer
              Container(
                height: 8,
                color: Color(0xFFF3F3F3),
              ),
              SizedBox(
                height: 11,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'My work',
                  style: TextStyle(
                    color: Color(0xFF0059FF),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '프로젝트 소개',
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        LogProjectModalWidget(
                          context,
                          onAddProject:
                              (date, projectname, tag, picturelist, content) {
                            addProject(
                                date, projectname, tag, picturelist, content);
                          },
                        );
                      },
                      child: Container(
                        width: 48,
                        height: 24,
                        decoration: ShapeDecoration(
                          color: Color(0xFF0059FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/plus-sm.svg",
                              color: Colors.white,
                              height: 10,
                              width: 10,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              '추가',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              projects.isEmpty
                  ? Container(
                      width: 328,
                      height: 78,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(12),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: SizedBox(
                        width: 126,
                        child: Center(
                          child: Text(
                            '프로젝트를 추가해주세요.',
                            style: TextStyle(
                              color: Color(0xFF4C4C4C),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: projects.map((Project project) {
                          return Column(
                            children: [
                              Container(
                                width: 328,
                                height: 42,
                                padding: const EdgeInsets.all(12),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFFCCCCCC)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  '${project.projectname}',
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 20),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFFCCCCCC)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 86,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: project.picturelist.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            width: 86,
                                            height: 86,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 6),
                                            decoration: ShapeDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    project.picturelist[index]),
                                                fit: BoxFit.cover,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Color(0xFFE6E6E6)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            // 이미지 삭제 등의 추가 기능을 여기에 추가할 수 있습니다
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 296,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 12),
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            color: Color(0xFFE6E6E6),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${project.date}",
                                      style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "${project.content}",
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
                              SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        }).toList(),
                      ),
                    ),
              SizedBox(
                height: 8,
              ),

              SizedBox(
                height: 11,
              ),
              //spacer
              Container(
                height: 8,
                color: Color(0xFFF3F3F3),
              ),
              SizedBox(
                height: 11,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Contact Me',
                  style: TextStyle(
                    color: Color(0xFF0059FF),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: 328,
                height: 42,
                margin: EdgeInsets.symmetric(horizontal: 16),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: TextField(
                  controller: emailController,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: '이메일을 입력해주세요.',
                    hintStyle: TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: EdgeInsets.all(12),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Phone',
                  style: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: 328,
                height: 42,
                margin: EdgeInsets.symmetric(horizontal: 16),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: TextField(
                  controller: phoneController,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: '전화번호를 입력해주세요.',
                    hintStyle: TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: EdgeInsets.all(12),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'SNS',
                  style: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Column(
                children: [
                  if (!showsns)
                    GestureDetector(
                      onTap: () async {
                        await fetchSnsData(
                            context.read<User_Data>().record.record!.id);
                        setState(() {
                          showsns = true;
                        });
                      },
                      child: Container(
                        width: 328,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(12),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFFE5EEFF),
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0x00CCCCCC)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '마이 프로필 SNS 연동하기',
                            style: TextStyle(
                              color: Color(0xFF0059FF),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (showsns && snsList != null)
                    Container(
                      width: 328,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: snsList.items.map((item) {
                          return Container(
                            width: 328,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.all(10),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: Color(0xFFE6E6E6),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    getIcon(item.data['account']),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      "${item.data['account']}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Transform.scale(
                                  scale: 0.8,
                                  child: CupertinoSwitch(
                                    value:
                                        snsCheckedMap[item.data['account']] ??
                                            false,
                                    activeColor: Color(0xFF0059FF),
                                    onChanged: (value) {
                                      setState(() {
                                        snsCheckedMap[item.data['account']] =
                                            value;
                                        print(
                                            'Item "${item.data['account']}" is checked: $value');
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                ],
              ),

              SizedBox(
                height: 11,
              ),
              //spacer
              Container(
                height: 8,
                color: Color(0xFFF3F3F3),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 17),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(color: Color(0xFFB3B3B3)),
                    top: BorderSide(width: 1, color: Color(0xFFB3B3B3)),
                    right: BorderSide(color: Color(0xFFB3B3B3)),
                    bottom: BorderSide(color: Color(0xFFB3B3B3)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        createLog();
                      },
                      child: Container(
                        width: 144,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFF0059FF)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '임시저장',
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
                        createLog();
                      },
                      child: Container(
                        width: 144,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: Color(0xFF0059FF),
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFF0059FF)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '수정완료',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getIcon(String account) {
    if (account.contains("github.com/")) {
      return SvgPicture.asset(
          "assets/icons/github.svg"); // GitHub 아이콘 이미지 경로로 변경
    } else if (account.contains("instagram.com/")) {
      return SvgPicture.asset(
          "assets/icons/instagram.svg"); // Instagram 아이콘 이미지 경로로 변경
    } else if (isValidEmail(account)) {
      return SvgPicture.asset("assets/icons/email.svg"); // 이메일 아이콘 이미지 경로로 변경
    } else {
      // 다른 경우에 대한 처리
      return Container(); // 또는 다른 기본값을 반환
    }
  }

  bool isValidEmail(String email) {
    // 이메일 형식이 유효한지 확인하는 로직을 구현
    // 예시로 간단한 형식 체크를 구현했으나, 실제로는 더 정교한 체크가 필요합니다.
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }
}

class Experience {
  final String date;
  final String project;

  Experience({required this.date, required this.project});

  @override
  String toString() {
    return 'Experience(date: $date, project: $project)';
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'project': project,
    };
  }
}

class Project {
  final String date;
  final String projectname;
  final String tag;
  final List picturelist;
  final String content;

  Project({
    required this.date,
    required this.projectname,
    required this.tag,
    required this.picturelist,
    required this.content,
  });

  @override
  String toString() {
    return 'Project(date: $date, project: $projectname, tag: $tag, picturelist: $picturelist,content: $content)';
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'projectname': projectname,
      'tag': tag,
      'picturelist': picturelist,
      'content': content,
    };
  }
}
