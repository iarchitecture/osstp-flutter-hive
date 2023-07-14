import 'package:flutter/material.dart';

class OnTapModel {
  int index;
  String name;

  OnTapModel(this.index, this.name);
}

navigationActionItem() {}

typedef OnTapFunction = Function(OnTapModel onTapModel);

/// [AppBar]
MainAppBar(
    {String? title,
      bool? centerTitle,
      bool automaticallyImplyLeading = true,

      /// custom style
      List<Widget>? actions,

      /// only title
      List<String>? rightActionList,
      OnTapFunction? onTapFunction}) {
  /// title
  Widget? titleWidget = title == null ? null : Text(title);

  List<Widget> action = [];
  if (actions != null) {
    action.addAll(actions);
  }
  if (rightActionList != null) {
    for (var element in rightActionList) {
      int index = rightActionList.indexOf(element);
      action.add(
        InkWell(
          onTap: () {
            if (onTapFunction != null) {
              onTapFunction(OnTapModel(index, element));
            }
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              element,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }}

  return AppBar(
    title: titleWidget,
    centerTitle: centerTitle,
    automaticallyImplyLeading: automaticallyImplyLeading,
    actions: action,
  );
}
