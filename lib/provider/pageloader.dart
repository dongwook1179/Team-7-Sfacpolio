import 'package:flutter/cupertino.dart';

class PageLoader with ChangeNotifier {
  int pagenum = 1;

  void Next(BuildContext context) {
    pagenum++;
    if (pagenum == 5) {
      pagenum = 1;
      // Navigator.push(context, CupertinoPageRoute(builder: (context)=> ));
    }
    notifyListeners();
  }

  void Previous() {
    pagenum--;
    if (pagenum == 0) {
      pagenum = 1;
    }
    notifyListeners();
  }
}
