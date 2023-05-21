import 'package:flutter/material.dart';

class Images {
  static Widget getImages(String name,
      {double? width, double? height, Color? color}) {
    return Image.asset(
      "assets/$name.png",
      fit: BoxFit.contain,
      color: color,
      width: width,
      height: height,
    );
  }
}
