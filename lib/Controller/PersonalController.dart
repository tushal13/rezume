import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/web.dart';

import '../Model/UrlModel.dart';

class PersonalIncfoController extends ChangeNotifier {
  ImagePicker imagePicker = ImagePicker();

  List<UrlModel> urls = [];
  Logger l = Logger();
  Uint8List image = Uint8List(0);

  pickImageFromCamera() async {
    XFile? pickimage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickimage != null) {
      image = await pickimage.readAsBytes();
    }
    l.t(image);
    notifyListeners();
  }

  pickImageFromGallery() async {
    XFile? pickimage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickimage != null) {
      image = await pickimage.readAsBytes();
    }
    l.t(image);
    notifyListeners();
  }

  addurl(UrlModel url) {
    urls.add(url);
    notifyListeners();
  }
}
