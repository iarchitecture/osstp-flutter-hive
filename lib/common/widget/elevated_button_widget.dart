import 'package:flutter/material.dart';

/// use for Separate buttons
///
class ElevatedButtonWidget extends StatelessWidget {
  ElevatedButtonWidget.normal({
    Key? key,
    this.titleText,
    this.child,
    this.backgroundColor,
    this.borderColor,
    this.disabledColor,
    this.radius = 10,
    this.onPressed,
    this.arrowImageName,
    this.arrowImageColor,
    this.padding,
    this.margin,
  }) : super(key: key);
  final Text? titleText;
  final Widget? child;
  final String? arrowImageName;
  final Color? arrowImageColor;
  final Color? backgroundColor;
  final Color? disabledColor;
  final Color? borderColor;
  final double radius;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  ///
  bool debounce = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          padding: const EdgeInsets.only(right: 5, left: 5),
          onSurface: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
        ),
        onPressed: () {
          if (debounce == false && onPressed != null) {
            onPressed!();
            debounce = true;
            Future.delayed(const Duration(milliseconds: 777), () {
              debounce = false;
            });
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Offstage(
              offstage: titleText == null ? true : false,
              child: titleText,
            ),
            Offstage(
              offstage: child == null ? true : false,
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
