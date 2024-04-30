import 'package:flutter/cupertino.dart';
import 'package:rezume/Model/EducationModel.dart';
import 'package:rezume/Model/LanguageModel.dart';
import 'package:rezume/Model/TechnicalSkillsModel.dart';

import '../Model/ProjectModel.dart';

class OtherInfoController extends ChangeNotifier {
  //Education input .............. //
  List<TextEditingController> schoolcontroller = [
    TextEditingController(),
    TextEditingController()
  ];
  List<TextEditingController> standardcontroller = [
    TextEditingController(),
    TextEditingController()
  ];
  List<TextEditingController> joiningcontroller = [
    TextEditingController(),
    TextEditingController()
  ];
  List<TextEditingController> endingcontroller = [
    TextEditingController(),
    TextEditingController()
  ];
  List<TextEditingController> percontroller = [
    TextEditingController(),
    TextEditingController()
  ];
  List<EducationModel> eductions = [];

  initForEduction() {
    if (schoolcontroller.length > 2 &&
        standardcontroller.length > 2 &&
        joiningcontroller.length > 2 &&
        endingcontroller.length > 2 &&
        percontroller.length > 2) {
      schoolcontroller.removeWhere((element) => element.text.isEmpty);
      standardcontroller.removeWhere((element) => element.text.isEmpty);
      joiningcontroller.removeWhere((element) => element.text.isEmpty);
      endingcontroller.removeWhere((element) => element.text.isEmpty);
      percontroller.removeWhere((element) => element.text.isEmpty);
    }
    if (schoolcontroller.isEmpty &&
            standardcontroller.isEmpty &&
            joiningcontroller.isEmpty &&
            endingcontroller.isEmpty &&
            percontroller.isEmpty ||
        schoolcontroller.length < 2 &&
            standardcontroller.length < 2 &&
            joiningcontroller.length < 2 &&
            endingcontroller.length < 2 &&
            percontroller.length < 2) {
      if (schoolcontroller.length == 1 &&
          standardcontroller.length == 1 &&
          joiningcontroller.length == 1 &&
          endingcontroller.length == 1 &&
          percontroller.length == 1) {
        schoolcontroller.add(TextEditingController());
        standardcontroller.add(TextEditingController());
        joiningcontroller.add(TextEditingController());
        endingcontroller.add(TextEditingController());
        percontroller.add(TextEditingController());
      } else {
        schoolcontroller
            .addAll([TextEditingController(), TextEditingController()]);
        standardcontroller
            .addAll([TextEditingController(), TextEditingController()]);
        joiningcontroller
            .addAll([TextEditingController(), TextEditingController()]);
        endingcontroller
            .addAll([TextEditingController(), TextEditingController()]);
        percontroller
            .addAll([TextEditingController(), TextEditingController()]);
      }
    }
  }

  addEducationfild() {
    schoolcontroller.add(TextEditingController());
    standardcontroller.add(TextEditingController());
    joiningcontroller.add(TextEditingController());
    endingcontroller.add(TextEditingController());
    percontroller.add(TextEditingController());
    notifyListeners();
  }

  addEducation() {
    for (int i = 0; i < schoolcontroller.length; i++) {
      String school = schoolcontroller[i].text;
      String standard = standardcontroller[i].text;
      String joining = joiningcontroller[i].text;
      String ending = endingcontroller[i].text;
      String per = percontroller[i].text;
      if (school.isNotEmpty &&
          standard.isNotEmpty &&
          joining.isNotEmpty &&
          ending.isNotEmpty &&
          per.isNotEmpty)
        eductions
            .add(EducationModel(i, school, standard, joining, ending, per));
    }
  }

  //Language input //
  List<TextEditingController> languagecontrollers = [
    TextEditingController(),
  ];
  List<LanguageModal> languages = [];
  initlanguage() {
    if (languagecontrollers.length > 2) {
      languagecontrollers.removeWhere((element) => element.text.isEmpty);
    }

    if (languagecontrollers.isEmpty || languagecontrollers.length < 2) {
      if (languagecontrollers.length == 1) {
        languagecontrollers.add(TextEditingController());
      } else {
        languagecontrollers
            .addAll([TextEditingController(), TextEditingController()]);
      }
    }
  }

  addlangfield() {
    languagecontrollers.add(TextEditingController());
    notifyListeners();
  }

  addLanguage() {
    for (int i = 0; i < languagecontrollers.length; i++) {
      String language = languagecontrollers[i].text;
      if (language.isNotEmpty) {
        languages.add(LanguageModal(i, language));
      }
    }
  }

  //Technical Skill input //

  List<TextEditingController> techskillcontrollers = [
    TextEditingController(),
  ];
  List<TechnicalSkillModel> techSkill = [];
  inittechskille() {
    if (techskillcontrollers.length > 2) {
      techskillcontrollers.removeWhere((element) => element.text.isEmpty);
    }

    if (techskillcontrollers.isEmpty || techskillcontrollers.length < 2) {
      if (techskillcontrollers.length == 1) {
        techskillcontrollers.add(TextEditingController());
      } else {
        techskillcontrollers
            .addAll([TextEditingController(), TextEditingController()]);
      }
    }
  }

  addtskillgfield() {
    techskillcontrollers.add(TextEditingController());
    notifyListeners();
  }

  addTechSkill() {
    for (int i = 0; i < techskillcontrollers.length; i++) {
      String language = techskillcontrollers[i].text;
      if (language.isNotEmpty) {
        techSkill.add(TechnicalSkillModel(i, language));
      }
    }
  }

  //ADD Project input//

  List<TextEditingController> projecttitlecontrollers = [
    TextEditingController()
  ];
  List<TextEditingController> projecturlcontrollers = [TextEditingController()];
  List<TextEditingController> projectdescontrollers = [TextEditingController()];
  List<ProjectModel> projects = [];
  initForProjects() {
    if (projecttitlecontrollers.length > 2 &&
        projecturlcontrollers.length > 2 &&
        projectdescontrollers.length > 2) {
      projecttitlecontrollers.removeWhere((element) => element.text.isEmpty);
      projecturlcontrollers.removeWhere((element) => element.text.isEmpty);
      projectdescontrollers.removeWhere((element) => element.text.isEmpty);
    }
    if (projecttitlecontrollers.isEmpty &&
            projecturlcontrollers.isEmpty &&
            projectdescontrollers.isEmpty ||
        projecttitlecontrollers.length < 2 &&
            projecturlcontrollers.length < 2 &&
            projectdescontrollers.length < 2) {
      if (projecttitlecontrollers.length == 1 &&
          projecturlcontrollers.length == 1 &&
          projectdescontrollers.length == 1) {
        projecttitlecontrollers.add(TextEditingController());
        projecturlcontrollers.add(TextEditingController());
        projectdescontrollers.add(TextEditingController());
      } else {
        projecttitlecontrollers
            .addAll([TextEditingController(), TextEditingController()]);
        projecturlcontrollers
            .addAll([TextEditingController(), TextEditingController()]);
        projectdescontrollers
            .addAll([TextEditingController(), TextEditingController()]);
      }
    }
  }

  addprojectfild() {
    projecttitlecontrollers.add(TextEditingController());
    projecturlcontrollers.add(TextEditingController());
    projectdescontrollers.add(TextEditingController());
    notifyListeners();
  }

  addProject() {
    for (int i = 0; i < projecttitlecontrollers.length; i++) {
      String projecttitle = projecttitlecontrollers[i].text;
      String projecturl = projecturlcontrollers[i].text;
      String projectdes = projectdescontrollers[i].text;
      if (projecttitle.isNotEmpty &&
          projecturl.isNotEmpty &&
          projectdes.isNotEmpty)
        projects.add(ProjectModel(i, projecttitle, projecturl, projectdes));
    }
  }
}
