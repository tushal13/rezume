import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:rezume/Controller/EasyStepperController.dart';
import 'package:rezume/Controller/OthrInfoController.dart';
import 'package:rezume/Controller/ResumeController.dart';
import 'package:rezume/Views/Screens/ResumePage.dart';

import '../../Utility/AppStyle.dart';
import '../Component/CustomeTextfield.dart';

class OtherInfoPage extends StatelessWidget {
  OtherInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OtherInfo',
          style: AppStyle.appbartitlestyle,
        ),
        centerTitle: true,
      ),
      body: Consumer<EasySteperController>(builder: (context, easy, _) {
        return SingleChildScrollView(
          child: Column(
            children: [
              EasyStepper(
                activeStep: easy.activeStap,
                enableStepTapping: true,
                showLoadingAnimation: false,
                finishedStepTextColor: Colors.black,
                internalPadding: 0,
                steps: [
                  EasyStep(
                      title: 'Education',
                      icon: Icon(CupertinoIcons.book_circle)),
                  EasyStep(
                      title: 'Technical Skills',
                      icon: Icon(CupertinoIcons.t_bubble)),
                  EasyStep(
                      title: 'Projects',
                      icon: Icon(Icons.work_history_outlined)),
                ],
              ),
              easy.activeStap == 1
                  ? EducationWidget(context)
                  : easy.activeStap == 2
                      ? LanguageAndSkillWidget(context)
                      : easy.activeStap == 3
                          ? ProjectsWidget(context)
                          : Column(),
            ],
          ),
        );
      }),
    );
  }
}

// I am back
// i want to go home

Widget EducationWidget(
  BuildContext context,
) {
  Size size = MediaQuery.of(context).size;
  return Consumer<OtherInfoController>(builder: (context, oth, _) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Educatione',
                  style: AppStyle.textfhedingstyle,
                ),
                IconButton(
                  onPressed: () {
                    oth.addEducationfild();
                  },
                  icon: Icon(CupertinoIcons.plus),
                ),
              ],
            ),
            ...List.generate(
              oth.schoolcontroller.length,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Eductione ${index + 1}',
                    style: AppStyle.textfhedingstyle,
                  ),
                  CustomeTextField(
                      title: "Qulificatione",
                      controller: oth.standardcontroller[index],
                      isbordershow: false,
                      hinttext: 'Qulificatione'),
                  CustomeTextField(
                      title: "SchoolName",
                      controller: oth.schoolcontroller[index],
                      isbordershow: false,
                      hinttext: 'SchoolName'),
                  Row(
                    children: [
                      Expanded(
                        child: CustomeTextField(
                            title: "Joining",
                            controller: oth.joiningcontroller[index],
                            isbordershow: false,
                            hinttext: 'Date of Joining'),
                      ),
                      Expanded(
                        child: CustomeTextField(
                            title: "ending",
                            controller: oth.endingcontroller[index],
                            isbordershow: false,
                            hinttext: 'Date of Ending'),
                      ),
                    ],
                  ),
                  CustomeTextField(
                      title: "Percentage",
                      controller: oth.percontroller[index],
                      isbordershow: false,
                      keyboardType: TextInputType.number,
                      hinttext: 'Percentage(%)'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                oth.addEducation();
                Provider.of<EasySteperController>(context, listen: false)
                    .nextstap();
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10, bottom: 20),
                height: size.height * 0.06,
                width: size.width,
                child: Text(
                  'Next',
                  style: AppStyle.btnstyle,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  });
}

Widget LanguageAndSkillWidget(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  EasySteperController step =
      Provider.of<EasySteperController>(context, listen: false);
  return Consumer<OtherInfoController>(builder: (context, oth, _) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Language',
                  style: AppStyle.textfhedingstyle,
                ),
                IconButton(
                  onPressed: () {
                    oth.addlangfield();
                  },
                  icon: Icon(CupertinoIcons.plus),
                ),
              ],
            ),
            ...List.generate(
                oth.languagecontrollers.length,
                (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomeTextField(
                            title: "Language ${index + 1}",
                            controller: oth.languagecontrollers[index],
                            isbordershow: false,
                            hinttext: 'English'),
                      ],
                    )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Technical Skills',
                  style: AppStyle.textfhedingstyle,
                ),
                IconButton(
                  onPressed: () {
                    oth.addtskillgfield();
                  },
                  icon: Icon(CupertinoIcons.plus),
                ),
              ],
            ),
            ...List.generate(
                oth.techskillcontrollers.length,
                (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomeTextField(
                            title: "TechSkill ${index + 1}",
                            controller: oth.techskillcontrollers[index],
                            isbordershow: false,
                            hinttext: 'Dart'),
                      ],
                    )),
            GestureDetector(
              onTap: () {
                oth.addLanguage();
                oth.addTechSkill();
                step.nextstap();
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10, bottom: 20),
                height: size.height * 0.06,
                width: size.width,
                child: Text(
                  'Next',
                  style: AppStyle.btnstyle,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  });
}

Widget ProjectsWidget(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  EasySteperController step =
      Provider.of<EasySteperController>(context, listen: false);
  return Consumer<OtherInfoController>(builder: (context, oth, _) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Project',
                  style: AppStyle.textfhedingstyle,
                ),
                IconButton(
                  onPressed: () {
                    oth.addprojectfild();
                  },
                  icon: Icon(CupertinoIcons.plus),
                ),
              ],
            ),
            ...List.generate(
                oth.projecttitlecontrollers.length,
                (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomeTextField(
                            title: "Project Title ${index + 1}",
                            controller: oth.projecttitlecontrollers[index],
                            isbordershow: false,
                            hinttext: 'Enter Project Name'),
                        CustomeTextField(
                            title: "Project Url ${index + 1}",
                            controller: oth.projecturlcontrollers[index],
                            isbordershow: false,
                            hinttext: 'Enter Project Url'),
                        CustomeTextField(
                            title: "Project  Description ${index + 1}",
                            controller: oth.projectdescontrollers[index],
                            maxline: 3,
                            isbordershow: true,
                            hinttext: 'Write Something About Project'),
                      ],
                    )),
            GestureDetector(
              onTap: () {
                oth.addProject();
                Provider.of<ResumeController>(context, listen: false)
                    .setResumeDetails(oth.eductions, oth.languages,
                        oth.techSkill, oth.projects);
                Logger().i(oth.languages[0].title);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ResumePage()));
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10, bottom: 20),
                height: size.height * 0.06,
                width: size.width,
                child: Text(
                  'Creat Resume',
                  style: AppStyle.btnstyle,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  });
}
