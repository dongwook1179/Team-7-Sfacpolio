import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/pagecontrol.dart';

class NextButton extends StatefulWidget {
  const NextButton({super.key});

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: context.watch<Page_Controller>().pagenum > 2 ? 32 : 30),
      child: Row(
        children: [
          context.watch<Page_Controller>().pagenum > 2
              ? GestureDetector(
                  onTap: () {
                    if (Provider.of<Page_Controller>(context, listen: false)
                            .pagenum ==
                        3) {
                      Provider.of<Page_Controller>(context, listen: false)
                          .select_info
                          .remove('service');
                    } else if (Provider.of<Page_Controller>(context,
                                listen: false)
                            .pagenum ==
                        4) {
                      Provider.of<Page_Controller>(context, listen: false)
                          .select_info
                          .remove('mbti');
                    } else if (Provider.of<Page_Controller>(context,
                                listen: false)
                            .pagenum ==
                        5) {
                      Provider.of<Page_Controller>(context, listen: false)
                          .select_info
                          .removeWhere(
                            (key, value) => key.contains('career'),
                          );
                    } else if (Provider.of<Page_Controller>(context,
                                listen: false)
                            .pagenum ==
                        6) {
                      Provider.of<Page_Controller>(context, listen: false)
                          .select_info
                          .removeWhere(
                            (key, value) => key.contains('condition'),
                          );
                    }
                    context.read<Page_Controller>().Next(context);
                  },
                  child: Container(
                    height: 50,
                    width: 144,
                    decoration: BoxDecoration(
                        color: Color(0xFFE5EEFF),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        '건너뛰기',
                        style: TextStyle(
                          color: Color(0xFF0059FF),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
          context.watch<Page_Controller>().pagenum > 2
              ? SizedBox(
                  width: 8,
                )
              : SizedBox(),
          Expanded(
            child: GestureDetector(
              onTap: () {
                context.read<Page_Controller>().Next(context);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: context.watch<Page_Controller>().pagenum == 1
                      ? (context
                                      .watch<Page_Controller>()
                                      .select_info['develop']
                                      ?.length ??
                                  0) !=
                              0
                          ? Color(0xFF0059FF)
                          : Color(0xFFE6E6E6)
                      : context.watch<Page_Controller>().pagenum == 2
                          ? (context
                                          .watch<Page_Controller>()
                                          .select_info['language']
                                          ?.length ??
                                      0) !=
                                  0
                              ? Color(0xFF0059FF)
                              : Color(0xFFE6E6E6)
                          : context.watch<Page_Controller>().pagenum == 3
                              ? (context
                                              .watch<Page_Controller>()
                                              .select_info['service']
                                              ?.length ??
                                          0) !=
                                      0
                                  ? Color(0xFF0059FF)
                                  : Color(0xFFE6E6E6)
                              : context.watch<Page_Controller>().pagenum == 4
                                  ? (context
                                                  .watch<Page_Controller>()
                                                  .select_info['mbti']
                                                  ?.length ??
                                              0) !=
                                          0
                                      ? Color(0xFF0059FF)
                                      : Color(0xFFE6E6E6)
                                  : context.watch<Page_Controller>().pagenum ==
                                          5
                                      ? (context
                                                      .watch<Page_Controller>()
                                                      .select_info[
                                                          'career_type']
                                                      ?.length ??
                                                  0) !=
                                              0
                                          ? Color(0xFF0059FF)
                                          : Color(0xFFE6E6E6)
                                      : context
                                                  .watch<Page_Controller>()
                                                  .pagenum ==
                                              6
                                          ? (context
                                                          .watch<
                                                              Page_Controller>()
                                                          .select_info[
                                                              'condition_type']
                                                          ?.length ??
                                                      0) !=
                                                  0
                                              ? Color(0xFF0059FF)
                                              : Color(0xFFE6E6E6)
                                          : Color(0xFFE6E6E6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    context.watch<Page_Controller>().pagenum == 6 ? '완료' : '다음',
                    style: TextStyle(
                      color: context.watch<Page_Controller>().pagenum == 1
                          ? (context
                                          .watch<Page_Controller>()
                                          .select_info['develop']
                                          ?.length ??
                                      0) !=
                                  0
                              ? Color(0xFFFFFFFF)
                              : Color(0xFF999999)
                          : context.watch<Page_Controller>().pagenum == 2
                              ? (context
                                              .watch<Page_Controller>()
                                              .select_info['language']
                                              ?.length ??
                                          0) !=
                                      0
                                  ? Color(0xFFFFFFFF)
                                  : Color(0xFF999999)
                              : context.watch<Page_Controller>().pagenum == 3
                                  ? (context
                                                  .watch<Page_Controller>()
                                                  .select_info['service']
                                                  ?.length ??
                                              0) !=
                                          0
                                      ? Color(0xFFFFFFFF)
                                      : Color(0xFF999999)
                                  : context.watch<Page_Controller>().pagenum ==
                                          4
                                      ? (context
                                                      .watch<Page_Controller>()
                                                      .select_info['mbti']
                                                      ?.length ??
                                                  0) !=
                                              0
                                          ? Color(0xFFFFFFFF)
                                          : Color(0xFF999999)
                                      : context
                                                  .watch<Page_Controller>()
                                                  .pagenum ==
                                              5
                                          ? (context
                                                          .watch<
                                                              Page_Controller>()
                                                          .select_info[
                                                              'career_type']
                                                          ?.length ??
                                                      0) !=
                                                  0
                                              ? Color(0xFFFFFFFF)
                                              : Color(0xFF999999)
                                          : context
                                                      .watch<Page_Controller>()
                                                      .pagenum ==
                                                  6
                                              ? (context
                                                              .watch<
                                                                  Page_Controller>()
                                                              .select_info[
                                                                  'condition_type']
                                                              ?.length ??
                                                          0) !=
                                                      0
                                                  ? Color(0xFFFFFFFF)
                                                  : Color(0xFF999999)
                                              : Color(0xFF999999),
                      fontSize: 15,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
