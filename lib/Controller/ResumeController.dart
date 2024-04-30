import 'package:flutter/material.dart';
import 'package:rezume/Model/LanguageModel.dart';
import 'package:rezume/Model/ProjectModel.dart';

import '../Model/EducationModel.dart';
import '../Model/PersonalInfoModel.dart';
import '../Model/TechnicalSkillsModel.dart';

class ResumeController extends ChangeNotifier {
  PerSonalInfoModel perSonalInfoModel = PerSonalInfoModel.init();
  List<EducationModel> educatione = [];
  List<LanguageModal> languages = [];
  List<TechnicalSkillModel> techskill = [];
  List<ProjectModel> projects = [];

  setPersonalinfo(PerSonalInfoModel perSonalInfo) {
    perSonalInfoModel = perSonalInfo;
    notifyListeners();
  }

  setResumeDetails(
      List<EducationModel> educationelist,
      List<LanguageModal> languageslist,
      List<TechnicalSkillModel> techskilllist,
      List<ProjectModel> projectslist) {
    educatione = educationelist;
    languages = languageslist;
    techskill = techskilllist;
    projects = projectslist;
    debugPrint(
        '${perSonalInfoModel},${educatione},${languages},${techskill},${projects}');
    notifyListeners();
  }
}
