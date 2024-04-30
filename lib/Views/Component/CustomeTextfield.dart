import 'package:flutter/Material.dart';
import 'package:rezume/Utility/AppStyle.dart';

class CustomeTextField extends StatelessWidget {
  String? title;
  TextEditingController? controller;
  String? Function(String?)? validator;
  bool? isbordershow;
  String? hinttext;
  int? maxline;
  int? maxlength;
  TextInputType? keyboardType;
  CustomeTextField(
      {Key? key,
      required this.title,
      required this.controller,
      this.validator,
      this.isbordershow,
      this.maxline,
      this.maxlength,
      this.keyboardType,
      required this.hinttext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? '', style: AppStyle.textfhedingstyle),
          TextFormField(
            controller: controller,
            validator: validator,
            maxLines: maxline,
            maxLength: maxlength,
            textInputAction: TextInputAction.next,
            keyboardType: keyboardType ?? TextInputType.name,
            decoration: InputDecoration(
              border: isbordershow ?? false
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 2,
                      ),
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
              hintText: hinttext,
              hintStyle: AppStyle.hintfstyle,
              filled: true,
              fillColor: Colors.grey.shade300,
            ),
          )
        ],
      ),
    );
  }
}
