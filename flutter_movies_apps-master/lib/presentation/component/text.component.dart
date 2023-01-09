import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextComponent{
  Widget title(
      {String? text = '',
        double size = 16.0,
        Color color = Colors.black,
        bool italic = false}) =>
      Text(
        text!,
        style: GoogleFonts.montserrat(
          fontSize: size,
          color: color,
          fontWeight: FontWeight.bold,
          height: 1.5,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        ),
      );

  Widget regular(
      {String? text = '',
        double size = 14.0,
        Color color = Colors.black,
        bool italic = false}) =>
      Text(
        text!,
        style: GoogleFonts.montserrat(
          fontSize: size,
          color: color,
          height: 1.5,
          fontWeight: FontWeight.w400,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        ),
      );

  Widget regularElipsis(
      {String? text = '',
        double size = 14.0,
        int maxLine = 2,
        Color color = Colors.black,
        bool italic = false}) =>
      Text(
        text!,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLine,
        style: GoogleFonts.montserrat(
          fontSize: size,
          color: color,
          height: 1.5,
          fontWeight: FontWeight.w400,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        ),
      );

  TextStyle styles({
    double size = 14.0,
    Color color = Colors.black,
    bool italic = false,
    weigth = FontWeight.w400,
  }) =>
      GoogleFonts.montserrat(
        fontSize: size,
        color: color,
        fontWeight: weigth,
        height: 1.5,
        fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      );
}

final comtext = TextComponent();
