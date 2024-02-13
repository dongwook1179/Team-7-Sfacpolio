import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pageloader.dart';
import 'package:team_7_sfacpolio/screen/onboarding.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageLoader()),
      ],
      child: CupertinoApp(color: CupertinoColors.white, home: Onboarding()),
    ),
  );
}
