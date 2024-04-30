import 'package:flutter/cupertino.dart';
import 'package:rezume/Model/EducationModel.dart';

class OtherInfoController extends ChangeNotifier {
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

  addurlfild() {
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
            .add(EducationModel(0, school, standard, joining, ending, per));
    }
  }
}
