import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:rezume/Controller/OthrInfoController.dart';

import '../../Utility/AppStyle.dart';
import '../Component/CustomeTextfield.dart';

class EducationInfoPage extends StatelessWidget {
  EducationInfoPage({super.key});
  GlobalKey<FormState> formkay = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<OtherInfoController>().initForEduction();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Eductione',
          style: AppStyle.textfhedingstyle.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.plus),
          ),
        ],
      ),
      body: Consumer<OtherInfoController>(builder: (context, oth, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                                validator: (v) {
                                  if (v!.isEmpty) {
                                    return 'Enter Qulificatione First';
                                  }
                                  return null;
                                },
                                isbordershow: false,
                                hinttext: 'Qulificatione'),
                            CustomeTextField(
                                title: "SchoolName",
                                controller: oth.schoolcontroller[index],
                                validator: (v) {
                                  if (v!.isEmpty) {
                                    return 'Enter SchoolName First';
                                  }
                                  return null;
                                },
                                isbordershow: false,
                                hinttext: 'SchoolName'),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomeTextField(
                                      title: "Joining",
                                      controller: oth.joiningcontroller[index],
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return 'Enter Date of Joining First';
                                        }
                                        return null;
                                      },
                                      isbordershow: false,
                                      hinttext: 'Date of Joining'),
                                ),
                                Expanded(
                                  child: CustomeTextField(
                                      title: "ending",
                                      controller: oth.endingcontroller[index],
                                      validator: (v) {
                                        if (v!.isEmpty) {
                                          return 'Enter Date of Ending First';
                                        }
                                        return null;
                                      },
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
                        )),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => EducationInfoPage()));
                    oth.addEducation();
                    oth.eductions
                        .forEach((element) => Logger().t(element.school));
                    Logger().i(oth.eductions[0].school);
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
      }),
    );
  }
}
//Todo:Add multiple list data
// i want to go home
