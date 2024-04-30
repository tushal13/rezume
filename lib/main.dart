import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rezume/Controller/OthrInfoController.dart';
import 'package:rezume/Controller/ResumeController.dart';

import 'Controller/EasyStepperController.dart';
import 'Controller/PersonalController.dart';
import 'Views/Screens/PersonalInfoPage.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => PersonalIncfoController()),
    ChangeNotifierProvider(create: (context) => ResumeController()),
    ChangeNotifierProvider(create: (context) => OtherInfoController()),
    ChangeNotifierProvider(create: (context) => EasySteperController()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ProfileInfoPage(),
    );
  }
}
