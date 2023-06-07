import 'package:flutter/material.dart';
import 'package:osstp_flutter_hive/common/widget/inkWell_button.dart';

import '../../../../common/theme/theme.dart';
import '../../../../common/utils/selected_item_model.dart';
import '../../../../common/widget/line_view.dart';

class MineBodyWidget extends StatelessWidget {
  const MineBodyWidget({
    Key? key,
    required this.context,
    required this.itemList,
    required this.index,
    this.authed,
    this.notAuthedCallback,
    required this.onTapCallback,
  }) : super(key: key);

  final BuildContext context;
  final List<SelectedItemModel> itemList;
  final int index;

  /// 认证成功
  final ValueChanged onTapCallback;

  /// 如果未认证
  final ValueChanged? notAuthedCallback;
  final bool? authed;

  @override
  Widget build(BuildContext context) {
    return _buildListItem(index, onTapCallback);
  }

  _buildListItem(int index, ValueChanged onTapCallback) {
    return Container(
      margin: index == 0 ? const EdgeInsets.only(bottom: 10) : null,
      child: Column(
        children: [
          index == 1 || index == 0 ? LineView(context) : const SizedBox(),
          InkWellButton.InkWell(
            backgroundColor: ThemeColors.listItemBackgroundThemeColor(context),
            onTap: () {
              onTapCallback(index);
            },
            // authed: authed,
            // notAuthedCallback: () {
            //   notAuthedCallback!(index);
            // },
            child: Container(
              color: Colors.transparent,
              margin: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
              child: Row(
                children: [
                  Container(padding: const EdgeInsets.only(right: 10), child: Icon(itemList[index].image, size: 16.0)),
                  Expanded(
                      child: Text(
                    itemList[index].title ?? "",
                    style: ThemeTextStyle.firstTitleStyle,
                  )),
                  const Icon(Icons.arrow_forward_ios, size: 16.0),
                ],
              ),
            ),
          ),
          index == itemList.length - 1 || index == 0
              ? LineView(context)
              : Row(
                  children: [
                    LineView(context, width: 35, color: ThemeColors.listItemBackgroundThemeColor(context)),
                    Expanded(child: LineView(context))
                  ],
                ),
        ],
      ),
    );
  }
}
