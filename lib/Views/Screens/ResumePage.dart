import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rezume/Controller/ResumeController.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ResumeController>(builder: (context, res, _) {
        return Column(
          children: [
            Container(
              width: size.width,
              padding: EdgeInsets.all(12),
              child: Row(
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
                            res.perSonalInfoModel.ptofileimage ?? Uint8List(0)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.grey),
            ),
            Text('Projects'),
            ...List.generate(res.projects.length,
                (index) => Text(res.projects[index].title ?? '')),
          ],
        );
      }),
    );
  }
}
//Todo:creat design minimal
