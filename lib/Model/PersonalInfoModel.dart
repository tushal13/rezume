import 'package:flutter/services.dart';
import 'package:rezume/Model/UrlModel.dart';

class PerSonalInfoModel {
  int? id;
  String? firstname;
  String? lastname;
  String? aboutme;
  String? email;
  String? job;
  String? address;
  String? phono;
  List<UrlModel>? urls;
  Uint8List? ptofileimage;

  PerSonalInfoModel(
    this.id,
    this.firstname,
    this.lastname,
    this.aboutme,
    this.email,
    this.job,
    this.address,
    this.phono,
    this.urls,
    this.ptofileimage,
  );

  PerSonalInfoModel.init() {
    print('Personalmodal initilize');
  }
}
