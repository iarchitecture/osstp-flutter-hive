import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widget/line_view.dart';
import '../../../../../common/widget/main_app_bar.dart';
import '../../../../../generated/l10n.dart';
import '../controller/mine_service_controller.dart';

// class MineServicePage extends StatelessWidget {
//   const MineServicePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<MineServiceController>(
//       init: MineServiceController(),
//       initState: (state) {},
//       builder: (controller) {
//         return Scaffold(
//           appBar: MainAppBar(title: S.of(context).setting_about),
//           body: SafeArea(
//             child: Container(color: Colors.green,)
//           ),
//         );
//       },
//     );
//   }
//
//   buildItem(BuildContext context, MineServiceController controller, int index) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(controller.itemList[index].title ?? ''),
//           controller.itemList[index].child ?? Container(),
//           LineView(context, margin: const EdgeInsets.only(top: 10))
//         ],
//       ),
//     );
//   }
// }
