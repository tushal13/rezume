import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';

import '../../Utility/AppStyle.dart';
import '../Component/CustomeTextfield.dart';

class OtherInfoPage extends StatelessWidget {
  OtherInfoPage({super.key});
  GlobalKey<FormState> formkay = GlobalKey<FormState>();
  TextEditingController stdcontroller = TextEditingController();
  TextEditingController stremcontroller = TextEditingController();
  TextEditingController durationcontroller = TextEditingController();
  TextEditingController prcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Eductione',
                  style: AppStyle.textfhedingstyle,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.plus),
                ),
              ],
            ),
            CustomeTextField(
                title: "Qulificatione",
                controller: stdcontroller,
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'Enter Qulificatione First';
                  }
                  return null;
                },
                isbordershow: false,
                hinttext: 'Bca'),
            CustomeTextField(
                title: "Qulificatione",
                controller: stremcontroller,
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'Enter Qulificatione First';
                  }
                  return null;
                },
                isbordershow: false,
                hinttext: 'Bca'),
          ],
        ),
      ),
    );
  }
}
//Todo:Add multiple list data
// i want to go home
