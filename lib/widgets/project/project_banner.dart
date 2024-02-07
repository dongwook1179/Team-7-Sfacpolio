import 'package:flutter/material.dart';

class Project_Banner extends StatefulWidget {
  const Project_Banner({super.key});

  @override
  State<Project_Banner> createState() => _Project_BannerState();
}

class _Project_BannerState extends State<Project_Banner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
            image: AssetImage('assets/images/community/banner.png'),
            fit: BoxFit.fitWidth),
      ),
      child: Stack(
        children: [
          Container(
              width: 328,
              height: 165,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff000000).withOpacity(0.4))),
          Container(
            width: 328,
            height: 165,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 18,
                  child: Text(
                    '러닝크루를 위한 안전 관리',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  height: 34,
                  child: Text(
                    '러닝 플랫폼 서비스',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 76,
                  height: 28,
                  child: Stack(
                    children: [
                      // Positioned(child: child)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
