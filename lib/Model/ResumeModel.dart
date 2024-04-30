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
  List<TechnicalSkillModel>? technicalSkillModel;
  List<ProjectModel>? projectModel;

  ResumeModel(
    this.id,
    this.perSonalInfoModel,
    this.educationModel,
    this.languageModal,
    this.technicalSkillModel,
    this.projectModel,
  );
}
