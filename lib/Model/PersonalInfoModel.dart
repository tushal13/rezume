import 'package:flutter/services.dart';
import 'package:rezume/Model/UrlModel.dart';

class PerSonalInfoModel {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? job;
  String? address;
  String? phono;
  List<UrlModel>? urls;
  Uint8List? ptofileimage;
  String? aboutme;

  PerSonalInfoModel(
      this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.job,
      this.address,
      this.phono,
      this.urls,
      this.ptofileimage,
      this.aboutme);
}
