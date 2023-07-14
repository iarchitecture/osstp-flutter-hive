import 'package:flutter/material.dart';

LineView(BuildContext context,
    {EdgeInsetsGeometry? margin, EdgeInsetsGeometry? padding, Color? color, double? width, double heigth = 1}) {
  return Container(
    width: width,
    margin: margin,
    padding: padding,
    height: heigth,
    color: color ?? Theme.of(context).dividerColor,
  );
}
