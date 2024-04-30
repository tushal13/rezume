import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rezume/Controller/PersonalController.dart';
import 'package:rezume/Utility/AppStyle.dart';
import 'package:rezume/Views/Component/CustomeTextfield.dart';
import 'package:rezume/Views/Screens/OtherInfoPage.dart';
import 'package:rezume/Views/Screens/ResumePage.dart';

import '../../Controller/ResumeController.dart';
import '../../Model/PersonalInfoModel.dart';

class ProfileInfoPage extends StatelessWidget {
  ProfileInfoPage({super.key});

  //i ll teke add image ui botomeshet  code from my prious project

  GlobalKey<FormState> formkay = GlobalKey<FormState>();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController jobcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonocontroller = TextEditingController();
  TextEditingController aboutmecontroller = TextEditingController();
  PerSonalInfoModel perSonalInfoModel = PerSonalInfoModel.init();

  @override
  Widget build(BuildContext context) {
    context.read<PersonalIncfoController>().initForUrls();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Personal Info'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ResumePage()));
              },
              icon: Icon(CupertinoIcons.doc_text))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child:
              Consumer<PersonalIncfoController>(builder: (context, pro, child) {
            return Column(
              children: [
                Form(
                  key: formkay,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                alignment: Alignment.bottomRight,
                                height: size.height * 0.1,
                                width: size.width * 0.26,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: MemoryImage(pro.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: size.height * 0.06,
                                left: size.width * 0.16,
                                bottom: 0,
                                child: IconButton(
                                  onPressed: () {
                                    imagepickerbottomsheet(context);
                                  },
                                  icon: Icon(
                                    Icons.add_circle_sharp,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: size.width * 0.65,
                                child: CustomeTextField(
                                    title: 'First Name',
                                    controller: firstnamecontroller,
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'Enter First Name';
                                      }
                                      return null;
                                    },
                                    isbordershow: false,
                                    hinttext: 'Enter First Name'),
                              ),
                              SizedBox(
                                width: size.width * 0.65,
                                child: CustomeTextField(
                                    title: 'Last Name',
                                    controller: lastnamecontroller,
                                    validator: (v) {
                                      if (v!.isEmpty) {
                                        return 'Enter Last Name';
                                      }
                                      return null;
                                    },
                                    isbordershow: false,
                                    hinttext: 'Enter Last Name'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomeTextField(
                          title: "About Me",
                          controller: aboutmecontroller,
                          maxline: 3,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Enter About Your Self First';
                            }
                            return null;
                          },
                          isbordershow: true,
                          hinttext: 'Enter About Your Self'),
                      CustomeTextField(
                          title: "Job Title",
                          controller: jobcontroller,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Enter Job Title First';
                            }
                            return null;
                          },
                          isbordershow: false,
                          hinttext: 'Flutter Devloper'),
                      CustomeTextField(
                          title: "Email",
                          controller: emailcontroller,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Enter Email First';
                            }
                            return null;
                          },
                          isbordershow: false,
                          hinttext: 'abc@gmail.com'),
                      CustomeTextField(
                          title: "Address",
                          controller: addresscontroller,
                          maxline: 2,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Enter Address First';
                            }
                            return null;
                          },
                          isbordershow: true,
                          hinttext: 'Enter Your Adsress'),
                      CustomeTextField(
                          title: "Phone No",
                          controller: phonocontroller,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Enter Phone No First';
                            }
                            return null;
                          },
                          isbordershow: false,
                          hinttext: '+91 34324 36854'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Urls',
                            style: AppStyle.textfhedingstyle,
                          ),
                          IconButton(
                            onPressed: () {
                              pro.addurlfild();
                            },
                            icon: Icon(CupertinoIcons.plus),
                          ),
                        ],
                      ),
                      ...List.generate(
                          pro.urltitlecontroller.length,
                          (index) => Row(
                                children: [
                                  Expanded(
                                    child: CustomeTextField(
                                      title: 'Enter url Title',
                                      controller: pro.urltitlecontroller[index],
                                      hinttext: 'Github',
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomeTextField(
                                      title: 'Enter url ',
                                      controller: pro.urlcontroller[index],
                                      hinttext: 'https://github.com/',
                                    ),
                                  ),
                                ],
                              )),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (formkay.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OtherInfoPage()));
                    }
                    pro.addurl();
                    Provider.of<ResumeController>(context, listen: false)
                        .setPersonalinfo(PerSonalInfoModel(
                            0,
                            firstnamecontroller.text,
                            lastnamecontroller.text,
                            aboutmecontroller.text,
                            emailcontroller.text,
                            jobcontroller.text,
                            addresscontroller.text,
                            aboutmecontroller.text,
                            pro.urls,
                            pro.image));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OtherInfoPage()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    height: size.height * 0.06,
                    width: size.width,
                    child: Text(
                      'Next',
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

//i am removing validation becose its user choice he want to submit ditails or not
imagepickerbottomsheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    showDragHandle: true,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(18),
        height: 170,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profile photo",
                  style: AppStyle.textfhedingstyle,
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 65,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 35,
                          ),
                          // title: Text('Camera'),
                          onPressed: () async {
                            Provider.of<PersonalIncfoController>(context,
                                    listen: false)
                                .pickImageFromCamera();
                            Navigator.of(context).pop;
                          }),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Text(
                      "Camera",
                      style: AppStyle.textfhedingstyle,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 65,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.photo_library,
                            size: 35,
                          ),
                          // title: Text('Gallery'),
                          onPressed: () async {
                            Provider.of<PersonalIncfoController>(context,
                                    listen: false)
                                .pickImageFromGallery();
                            Navigator.of(context).pop;
                          }),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Text("Gallery", style: AppStyle.textfhedingstyle),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

// there is problem my leptop disk was full so recording stoped
