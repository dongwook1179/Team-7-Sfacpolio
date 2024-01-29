import 'package:flutter/cupertino.dart';
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
    return GestureDetector(
      onTap: () {
        // print(context.read<Page_Controller>().slot_active.length);
        context.read<Page_Controller>().Next(context);
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: context.watch<Page_Controller>().slot_active.length > 0
              ? Color(0xFF0059FF)
              : Color(0xFFE6E6E6),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            '다음',
            style: TextStyle(
              color: context.watch<Page_Controller>().slot_active.length > 0
                  ? Color(0xFFFFFFFF)
                  : Color(0xFF999999),
              fontSize: 15,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
