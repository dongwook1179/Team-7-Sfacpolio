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
                  width: MediaQuery.of(context).size.width,
                  height: 28,
                  child: Stack(
                    children: [
                      for (int i = 1; i < 5; i++)
                        Positioned(
                          top: 0,
                          left: 16 * (i - 1),
                          child: i != 4
                              ? Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Color(0xffFFFFFF),
                                      ),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/main/log-profile$i.png'),
                                          fit: BoxFit.cover)),
                                )
                              : Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Color(0xffFFFFFF),
                                      ),
                                      shape: BoxShape.circle,
                                      color: Color(0xD6999999)),
                                  child: Center(
                                      child: Text(
                                    '+2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                                ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Spacer(),
                      IntrinsicWidth(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0x99020202),
                              borderRadius: BorderRadius.circular(100)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                          child: Row(
                            children: [
                              Text(
                                '🔥 진행 ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '17',
                                style: TextStyle(
                                  color: Color(0xFF337AFF),
                                  fontSize: 11,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '일째',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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
