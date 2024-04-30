import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rezume/Controller/ResumeController.dart';
import 'package:rezume/Utility/AppStyle.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ResumeController>(builder: (context, res, _) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: size.width,
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      height: size.height * 0.1,
                      width: size.width * 0.26,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: MemoryImage(
                              res.perSonalInfoModel.ptofileimage ??
                                  Uint8List(0)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              res.perSonalInfoModel.firstname ?? '',
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              res.perSonalInfoModel.lastname ?? '',
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ...List.generate(
                              res.perSonalInfoModel.urls!.length,
                              (index) => Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 5,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    res.perSonalInfoModel.urls?[index].title ??
                                        '',
                                    style: GoogleFonts.lato(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(color: Colors.grey),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'CONTACT',
                            style: AppStyle.resumheadingstyle,
                          ),
                          ContactTile(
                              Icons.phone, res.perSonalInfoModel.aboutme),
                          ContactTile(Icons.email, res.perSonalInfoModel.email),
                          ContactTile(
                              Icons.pin_drop, res.perSonalInfoModel.address),
                          const Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Text(
                            'ABOUT ME',
                            style: AppStyle.resumheadingstyle,
                          ),
                          Text(
                            res.perSonalInfoModel.phono ?? '',
                            style: AppStyle.resumsubtitle,
                          ),
                          const Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Text(
                            'TECHNICAL SKILLS',
                            style: AppStyle.resumheadingstyle,
                          ),
                          ...List.generate(
                              res.techskill.length,
                              (index) => Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        size: 8,
                                      ),
                                      SizedBox(
                                        width: 05,
                                      ),
                                      Text(res.techskill[index].title ?? ""),
                                    ],
                                  ))
                        ],
                      ),
                    ),
                    Container(
                      width: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [],
                      ),
                      decoration: BoxDecoration(color: Colors.black),
                    ),
                    SizedBox(
                      width: size.width * 0.46,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('EDUCATION'.toUpperCase(),
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          ...List.generate(
                              res.educatione.length,
                              (index) => EducationTile(
                                  res.educatione[index].standard,
                                  res.educatione[index].per ?? '',
                                  res.educatione[index].school ?? '',
                                  res.educatione[index].joining ?? '',
                                  res.educatione[index].ending ?? '')),
                          const Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Text(
                            'project work history'.toUpperCase(),
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ...List.generate(
                              res.projects.length,
                              (index) => ProjectTile(
                                  res.projects[index].title,
                                  res.projects[index].url,
                                  res.projects[index].des)),
                          const Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'language'.toUpperCase(),
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ...List.generate(
                                  res.languages.length,
                                  (index) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 8,
                                          ),
                                          SizedBox(
                                            width: 05,
                                          ),
                                          Text(
                                              res.languages[index].title ?? ""),
                                        ],
                                      ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

//Todo:creat design minimal
Widget ContactTile(IconData iconData, String? title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(
        iconData,
        size: 16,
      ),
      SizedBox(
        width: 5,
      ),
      Text(
        title ?? '',
        style: AppStyle.resumsubtitle,
      ),
    ],
  );
}

Widget EducationTile(String? standard, String per, String school,
    String joining, String ending) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        '${standard ?? ''} (${per}%)',
        style: AppStyle.resumsubtitle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text('${school} '),
      Text('${joining} - ${ending}')
    ],
  );
}

Widget ProjectTile(String? title, String? url, String? des) {
  return Container(
    padding: const EdgeInsets.all(4.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${title}',
          overflow: TextOverflow.clip,
          style: AppStyle.resumsubtitle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              decoration:
                  url != '' ? TextDecoration.underline : TextDecoration.none),
        ),
        Text(
          des ?? '',
          overflow: TextOverflow.clip,
          style: AppStyle.resumsubtitle.copyWith(fontSize: 10),
        ),
      ],
    ),
  );
}
