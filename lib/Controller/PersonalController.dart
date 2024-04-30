import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/web.dart';

import '../Model/UrlModel.dart';

class PersonalIncfoController extends ChangeNotifier {
  ImagePicker imagePicker = ImagePicker();
  List<TextEditingController> urltitlecontroller = [
    TextEditingController(),
    TextEditingController()
  ];
  List<TextEditingController> urlcontroller = [
    TextEditingController(),
    TextEditingController()
  ];
  List<UrlModel> urls = [];

  Logger l = Logger();
  Uint8List image = Uint8List(0);
  initForUrls() {
    if (urltitlecontroller.length > 2 && urlcontroller.length > 2) {
      urltitlecontroller.removeWhere((element) => element.text.isEmpty);
      urlcontroller.removeWhere((element) => element.text.isEmpty);
    }
    if (urltitlecontroller.isEmpty && urlcontroller.isEmpty ||
        urltitlecontroller.length < 2 && urlcontroller.length < 2) {
      if (urltitlecontroller.length == 1 && urlcontroller.length == 1) {
        urltitlecontroller.add(TextEditingController());
        urlcontroller.add(TextEditingController());
        l.i('if');
      } else {
        l.i('else');
        urltitlecontroller
            .addAll([TextEditingController(), TextEditingController()]);
        urlcontroller
            .addAll([TextEditingController(), TextEditingController()]);
      }
    }
  }

  addurlfild() {
    l.i('start...');
    urltitlecontroller.add(TextEditingController());
    urlcontroller.add(TextEditingController());
    l.i(urltitlecontroller.length);
    notifyListeners();
  }

  addurl() {
    for (int i = 0; i < urltitlecontroller.length; i++) {
      String title = urltitlecontroller[i].text;
      String url = urlcontroller[i].text;
      if (title.isNotEmpty && url.isNotEmpty) {
        urls.add(UrlModel(title, url));
      }
    }
  }

  pickImageFromCamera() async {
    XFile? pickimage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickimage != null) {
      image = await pickimage.readAsBytes();
    }
    notifyListeners();
  }

  pickImageFromGallery() async {
    XFile? pickimage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickimage != null) {
      image = await pickimage.readAsBytes();
    }
    notifyListeners();
  }
}
