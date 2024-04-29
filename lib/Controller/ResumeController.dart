import 'package:flutter/material.dart';

import '../Model/PersonalInfoModel.dart';

class ResumeController extends ChangeNotifier {
  PerSonalInfoModel perSonalInfoModel = PerSonalInfoModel.init();

  personalinfo(PerSonalInfoModel personalinfo) {
    perSonalInfoModel = personalinfo;
    notifyListeners();
  }
}
