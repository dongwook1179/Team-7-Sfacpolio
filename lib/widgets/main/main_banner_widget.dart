import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainBannerWidget extends StatelessWidget {
  final AssetImage backgroundimage;
  final String? title;
  final String? subtitle;
  const MainBannerWidget(
      {super.key, required this.backgroundimage, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 261,
      padding: EdgeInsets.only(top: 91, left: 16),
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          image: backgroundimage,
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title == "" && subtitle == "")
              SizedBox(
                width: 148,
                height: 25,
                child: Text(
                  '스팩님, 안녕하세요',
                  style: TextStyle(
                    color: Color(0xFF616784),
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            if (title == "" && subtitle == "")
              SizedBox(
                width: 271,
                child: Text(
                  '지금 개인 설정하면 나에게 더 꼭 맞는 맞춤 항목을 볼 수 있어요! ',
                  style: TextStyle(
                    color: Color(0xFF616784),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            if (title == "" && subtitle == "")
              SizedBox(
                height: 20,
              ),
            if (title == "" && subtitle == "")
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 128.016,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.30000001192092896),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '개인 맞춤 설정 하기',
                        style: TextStyle(
                          color: Color(0xFF7E87B5),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/chevron-right.svg",
                        color: Color(0xFF7E87B5),
                        width: 16,
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            if (title != "" && subtitle != "")
              SizedBox(
                height: 50,
              ),
            if (title != "" && subtitle != "")
              Text(
                title!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            if (title != "" && subtitle != "")
              Text(
                subtitle!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
