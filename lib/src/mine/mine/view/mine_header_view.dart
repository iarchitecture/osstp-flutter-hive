import 'package:flutter/material.dart';
import 'package:osstp_network/osstp_network.dart';
import '../../../../common/theme/theme.dart';
import '../../../../common/utils/logger.dart';
import '../../../../common/utils/string_utils.dart';
import '../../../../common/widget/inkWell_button.dart';
import '../../../../common/widget/line_view.dart';

class MineHeaderView extends StatelessWidget {
  /// 认证成功
  VoidCallback? itemCallback;
  VoidCallback? avatarCallback;

  /// 如果未认证
  VoidCallback? notAuthedCallback;
  bool? authed;


  MineHeaderView(
      {Key? key, this.notAuthedCallback, this.itemCallback, this.authed,this.avatarCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWellButton.InkWell(
          backgroundColor: ThemeColors.listItemBackgroundThemeColor(context),
          authed: authed,
          notAuthedCallback: () {
            notAuthedCallback!();
          },
          onTap: () {
            itemCallback!();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWellButton.normal(
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: const Icon(Icons.ac_unit),
                        ),
                        onTap: () {
                          if (avatarCallback != null) {
                            avatarCallback!();
                          }
                        }),
                    Expanded(
                      child: Container(
                        height: 60,
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                stringValue('name', placeholder: "昵称"),
                                textAlign: TextAlign.left,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(alignment: Alignment.bottomRight, child: const Text("账号：")),
                                Expanded(child: Text("--")),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16.0),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 60),
                  child: ElevatedButton(
                    child: const Text("+ 状态"),
                    onPressed: () {
                      osstpLoggerNoStack.d("+状态");
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        LineView(
          context,
          margin: EdgeInsets.only(bottom: 10),
        )
      ],
    );
  }
}
