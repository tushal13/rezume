import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rezume/Utility/AppStyle.dart';
import 'package:rezume/Views/Component/CustomeTextfield.dart';

class ProfileInfoPage extends StatelessWidget {
  ProfileInfoPage({super.key});

  GlobalKey formkay = GlobalKey();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController jobcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonocontroller = TextEditingController();
  TextEditingController urltitlecontroller = TextEditingController();
  TextEditingController urlcontroller = TextEditingController();
  TextEditingController aboutmecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Personal Info'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
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
                        controller: emailcontroller,
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
                        controller: aboutmecontroller,
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
                        controller: emailcontroller,
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
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.plus),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomeTextField(
                            title: 'Enter url Title',
                            controller: urltitlecontroller,
                            hinttext: 'Github',
                          ),
                        ),
                        Expanded(
                          child: CustomeTextField(
                            title: 'Enter url ',
                            controller: urlcontroller,
                            hinttext: 'https://github.com/',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
//writing ui and what to do in book
