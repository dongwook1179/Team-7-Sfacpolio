import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '/widgets/onboarding/onboardingbody.dart';
import '/widgets/onboarding/nextbutton.dart';
import '/widgets/onboarding/progressbar.dart';
import '/widgets/onboarding/questiontext.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: ChangeNotifierProvider(
      create: (BuildContext context) => PageController(),
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 45),
          padding: EdgeInsets.zero,
          child: Column(children: [
            Container(child: ProgressBar()),
            IntrinsicHeight(
              child: Container(
                child: Column(children: [
                  QuestionText(),
                  OnboardingBody(),
                ]),
              ),
            ),
            Container(height: 50, child: NextButton()),
          ]),
        ),
      ),
    ));
  }
}
