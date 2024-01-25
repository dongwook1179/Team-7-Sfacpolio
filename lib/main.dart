import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/screen/onboarding.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Page_Controller()),
      ],
      child: CupertinoApp(color: CupertinoColors.white, home: Onboarding()),
    ),
  );
}
