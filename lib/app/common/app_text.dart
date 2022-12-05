import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String data;
  final TextAlign align;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const TextWidget({
    super.key,
    required this.data,
    required this.align,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: align,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class TextWidgetNerko extends StatelessWidget {
  final String data;
  final TextAlign align;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const TextWidgetNerko({
    super.key,
    required this.data,
    required this.align,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: align,
      style: GoogleFonts.nerkoOne(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
