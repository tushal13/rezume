import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
            ),
            Form(
              key: formkay,
              child: Column(
                children: [
                  TextFormField(
                    controller: firstnamecontroller,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
//writing ui and what to do in book
