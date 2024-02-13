import 'package:flutter/cupertino.dart';
import '/widgets/onboarding/languageinput.dart';
import '/widgets/onboarding/languageslot.dart';
import '/widgets/onboarding/searchfield.dart';
import 'selectslot_1.dart';

class UseLanguage extends StatefulWidget {
  const UseLanguage({super.key});

  @override
  State<UseLanguage> createState() => _UseLanguageState();
}

class _UseLanguageState extends State<UseLanguage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Container(
      height: 540,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchField(),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: LanguageSlot(),
              ),
            ),
          ),
          Language_Input(),
          Container(
            height: 56,
            margin: EdgeInsets.only(bottom: 12),
            alignment: Alignment.bottomLeft,
            child: Select_Slot_1(),
          ),
        ],
      ),
    ));
  }
}
