import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/widgets/tag_slot.dart';

void main() {
  runApp(MainProjectCardWidget(
    backgroundimagestring: "assets/images/main/Project1.png",
    title: '러닝 플랫폼 서비스',
    subtitle: '러닝크루를 위한 안전 관리',
    tag1: '백엔드',
    tag2: '기획',
    tag3: '디자이너',
    view: 320,
    like: 20,
  ));
}

class MainProjectCardWidget extends StatelessWidget {
  final String backgroundimagestring;
  final String title;
  final String subtitle;
  final String? tag1;
  final String? tag2;
  final String? tag3;
  final int view;
  final int like;
  const MainProjectCardWidget(
      {super.key,
      required this.backgroundimagestring,
      required this.title,
      required this.subtitle,
      this.tag1,
      this.tag2,
      this.tag3,
      required this.view,
      required this.like});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 143,
      width: 157,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: ShapeDecoration(
        color: Colors.black.withOpacity(0.20000000298023224),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        image: DecorationImage(
          image: AssetImage(backgroundimagestring),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            overflow: TextOverflow.ellipsis,
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            subtitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 11.5,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              if (tag1 != null)
                Container(
                  margin: EdgeInsets.only(right: 4),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(0xFFE5EEFF),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      tag1!,
                      style: TextStyle(
                        color: Color(0xFF0059FF),
                        fontSize: 10.3,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              if (tag2 != null)
                Container(
                  margin: EdgeInsets.only(right: 4),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(0xFFE5EEFF),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      tag2!,
                      style: TextStyle(
                        color: Color(0xFF0059FF),
                        fontSize: 10.3,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              if (tag3 != null)
                Container(
                  margin: EdgeInsets.only(right: 4),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(0xFFE5EEFF),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      tag3!,
                      style: TextStyle(
                        color: Color(0xFF0059FF),
                        fontSize: 10.3,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/eye.svg",
                color: Colors.white,
                width: 16,
                height: 16,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                view.toString(),
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                "assets/icons/heart.svg",
                color: Colors.white,
                width: 16,
                height: 16,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                like.toString(),
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
