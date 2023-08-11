// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText(
      {super.key,
      required this.text,
      this.align,
      this.fontFamily,
      this.color,
      this.fWeight,
      this.size,
      this.maxline,
      this.overflow});

  final String? text;
  final Color? color;
  final FontWeight? fWeight;
  final double? size;
  final TextAlign? align;
  final String? fontFamily;
  final int? maxline;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: align,
      textScaleFactor: 1.0,
      style: TextStyle(
        fontFamily: fontFamily,
        color: color ?? Colors.black,
        fontWeight: fWeight ?? FontWeight.normal,
        fontSize: size ?? 13,
      ),
      maxLines: maxline ?? 6,
      overflow: overflow,
    );
  }
}
