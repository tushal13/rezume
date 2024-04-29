import 'package:rezume/Model/EducationModel.dart';
import 'package:rezume/Model/LanguageModel.dart';
import 'package:rezume/Model/PersonalInfoModel.dart';
import 'package:rezume/Model/ProjectModel.dart';
import 'package:rezume/Model/TechnicalSkillsModel.dart';

class ResumeModel {
  int? id;
  PerSonalInfoModel? perSonalInfoModel;
  List<EducationModel>? educationModel;
  List<LanguageModal>? languageModal;
  List<ProjectModel>? projectModel;
  List<TechnicalSkillModel>? technicalSkillModel;
  List<EducationModel>? certificatecourses;

  ResumeModel(
      this.id,
      this.perSonalInfoModel,
      this.educationModel,
      this.languageModal,
      this.projectModel,
      this.technicalSkillModel,
      this.certificatecourses);
}
