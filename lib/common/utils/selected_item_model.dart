import 'package:flutter/material.dart';

class SelectedItemModel {
  final String? title;
  final IconData? image;
  final Widget? child;
  final String? routesName;
  SelectedItemModel({
    required this.title,
    this.image,
    this.child,
    this.routesName,
  });
}

