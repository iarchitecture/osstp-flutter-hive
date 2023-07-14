import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osstp_flutter_hive/common/widget/elevated_button_widget.dart';
import 'package:osstp_flutter_hive/common/widget/line_view.dart';
import '../../generated/l10n.dart';
import '../global/constant.dart';
import '../utils/screen_utils.dart';

/// GetX dialog
class GetXDialog {
  static Future<T?> show<T>({
    String? title,
    TextStyle? titleStyle,

    /// 标题对齐
    AlignmentGeometry? titleTextAlign = Alignment.center,

    /// 文本内容：如果contentWidget != null, 则content不显示
    String? content,

    /// 自定义 Widget 内容
    Widget? contentWidget,

    /// 自定义 Dialog 所有内容
    /// 其他所有的都不起作用
    Widget? dialogWidget,

    /// 内容对齐： 针对[content]而不对[contentWidget]设置
    TextAlign? contentTextAlign = TextAlign.left,

    /// 当[customWidget] != null 时，
    /// [title]、[content]、[confirmTitle]、[cancelTitle]等所有的dialog为自定义
    Widget? customWidget,

    ///
    VoidCallback? onConfirm,
    String? confirmTitle,
    VoidCallback? onCancel,
    String? cancelTitle,
    bool showCancelButton = false,

    /// 禁止反复弹出
    bool denied = true,

    /// 以下为 GetX Dialog 的属性
    bool barrierDismissible = false,
    Color? barrierColor,
    bool useSafeArea = true,
    Object? arguments,
    Duration? transitionDuration,
    Curve? transitionCurve,
    String? name,
    RouteSettings? routeSettings,
  }) {
    String confirm = confirmTitle ?? S.current.general_confirm;
    String cancel = cancelTitle ?? S.current.general_cancel;
    List<Widget> actions = [];

    /// 取消按钮
    if (cancelTitle != null || showCancelButton == true) {
      actions.add(
        Expanded(
          child: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                cancel,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            onTap: () {
              Navigator.of(Get.context ?? navigatorKey.currentState!.overlay!.context).pop();
              if (onCancel != null) {
                onCancel();
              }
            },
          ),
        ),
      );

      actions.add(
        const SizedBox(
          height: 40,
          child: VerticalDivider(
            width: 1,
            indent: 0,
            endIndent: 0,
            thickness: 1.0,
          ),
        ),
      );
    }

    /// 确定按钮
    actions.add(
      Expanded(
        child: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              confirm,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          onTap: () {
            Navigator.of(Get.context ?? navigatorKey.currentState!.overlay!.context).pop();
            if (onConfirm != null) {
              onConfirm();
            }
          },
        ),
      ),
    );

    Widget result = dialogWidget ??
        WillPopScope(
          onWillPop: () async {
            // 防止Android物理返回键作用
            return barrierDismissible;
          },
          child: Center(
            child: Material(
              borderRadius: BorderRadius.circular(10), // 圆角
              clipBehavior: Clip.hardEdge,
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: osstpScreenHeight() / 4 * 3,
                    maxWidth: osstpScreenWidth() - 40,
                    minWidth: osstpScreenWidth() - 80),
                child: customWidget ??
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Offstage(
                          offstage: title == null ? true : false,
                          child: Container(
                            alignment: titleTextAlign,
                            margin: const EdgeInsets.all(15),
                            child: Text(
                              title ?? "",
                              textAlign: TextAlign.center,
                              style: titleStyle ??= const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Flexible(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shrinkWrap: true,
                            children: [
                              contentWidget ??
                                  Offstage(
                                    offstage: content == null ? true : false,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 10, right: 10, bottom: 10, top: (title == null ? 20 : 10)),
                                      child: Text(
                                        content ?? "",
                                        textAlign: contentTextAlign,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              const Divider(
                                height: 1,
                                indent: 0,
                                endIndent: 0,
                                thickness: 1.0,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  mainAxisSize: MainAxisSize.max,
                                  children: actions),
                            ],
                          ),
                        )
                      ],
                    ),
              ),
            ),
          ),
        );
    return Get.dialog(
      result,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      navigatorKey: navigatorKey,
      arguments: arguments,
      transitionDuration: transitionDuration,
      transitionCurve: transitionCurve,
      name: name,
      routeSettings: routeSettings,
    );
  }

  /// 作为前后台启动唤起启动页面使用
  static Future<T?> general<T>({
    /// 以下为Get默认属性
    required RoutePageBuilder pageBuilder,
    bool barrierDismissible = false,
    String? barrierLabel,
    Color? barrierColor,
    Duration transitionDuration = const Duration(milliseconds: 200),
    RouteTransitionsBuilder? transitionBuilder,
    GlobalKey<NavigatorState>? navigatorKey,
    RouteSettings? routeSettings,
  }) =>
      Get.generalDialog(
          pageBuilder: pageBuilder,
          transitionDuration: transitionDuration,
          transitionBuilder: transitionBuilder,
          navigatorKey: navigatorKey);
}

GetXDialogDebug(String? title) {
  GetXDialog.show(title: title, contentTextAlign: TextAlign.center, content: "模块构建中", showCancelButton: true);
}
