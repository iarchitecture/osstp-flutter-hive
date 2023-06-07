import 'package:flutter/material.dart';
import '../../../../../common/theme/theme.dart';
import '../../../../../common/utils/selected_item_model.dart';
import '../../../../../common/widget/inkWell_button.dart';
import '../../../../../common/widget/line_view.dart';

/// 设定主画面 list item
class SettingHomeItem extends StatelessWidget {
  const SettingHomeItem({
    Key? key,
    required this.context,
    required this.itemList,
    required this.index,
    required this.needSpaceList,
    required this.onTapCallback,
  }) : super(key: key);

  final BuildContext context;
  final List<SelectedItemModel> itemList;
  final int index;
  final List<int> needSpaceList;
  final ValueChanged onTapCallback;
  @override
  Widget build(BuildContext context) {
    return _buildListItem(index, onTapCallback);
  }

  _buildListItem(int index, ValueChanged onTapCallback) {
    return Container(
      margin: needSpaceList.contains(index) ? const EdgeInsets.only(bottom: 10) : null,
      child: Column(
        children: [
          LineView(context),
          InkWellButton.InkWell(
            backgroundColor: ThemeColors.listItemBackgroundThemeColor(context),
            onTap: () {
              onTapCallback(index);
            },
            child: Container(
              color: Colors.transparent,
              margin: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
              child: Row(
                children: [
                  Container(padding: const EdgeInsets.only(right: 10), child: Icon(itemList[index].image, size: 16)),
                  Expanded(
                      child: Text(
                    itemList[index].title ?? "",
                    style: ThemeTextStyle.firstTitleStyle,
                  )),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          ),
          index == itemList.length - 1 || needSpaceList.contains(index) ? LineView(context) : const SizedBox(),
        ],
      ),
    );
  }
}
