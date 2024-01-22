import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pageloader.dart';

class NextButton extends StatefulWidget {
  const NextButton({super.key});

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: ChangeNotifierProvider(
      create: (BuildContext context) => PageLoader(),
      child: GestureDetector(
        onTap: () {
          context.read<PageLoader>().Next(context);
        },
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Color(0xFF0059FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '다음',
              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 15,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
