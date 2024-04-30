import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static TextStyle textfhedingstyle = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w800,
  );
  static TextStyle hintfstyle = GoogleFonts.roboto(
      fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade500);
  static TextStyle btnstyle = GoogleFonts.roboto(
      fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle resumheadingstyle = GoogleFonts.lato(
      fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0.5);
  static TextStyle resumsubtitle = GoogleFonts.lato(
      fontSize: 10, fontWeight: FontWeight.w500, letterSpacing: 0.75);
  static TextStyle appbartitlestyle =
      GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w600);
}
