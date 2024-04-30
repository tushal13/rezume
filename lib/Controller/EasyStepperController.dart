import 'package:flutter/cupertino.dart';

class EasySteperController extends ChangeNotifier {
  int activeStap = 1;

  nextstap() {
    activeStap++;
    notifyListeners();
  }
}
