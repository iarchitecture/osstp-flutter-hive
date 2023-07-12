import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../../common/utils/logger.dart';
import '../../../../common/widget/loading_widget.dart';
import '../api/home_api.dart';
import '../model/home_model.dart';

class HomeController extends SuperController {
  final List<Widget> imagesData = [
    const Icon(
      Icons.flutter_dash_rounded,
      color: Color(0xffF67904),
      size: 160,
    ),
    const Icon(
      Icons.safety_check_rounded,
      color: Color(0xffD12D2E),
      size: 160,
    ),
    const Icon(
      Icons.view_module_rounded,
      color: Color(0xff7A1EA1),
      size: 160,
    ),
    const Icon(
      Icons.free_breakfast_rounded,
      color: Color(0xff1773CF),
      size: 160,
    ),
  ];

  final List<Color> backgroundColors = [
    const Color(0xffF67904),
    const Color(0xffD12D2E),
    const Color(0xff7A1EA1),
    const Color(0xff1773CF)
  ];

  RefreshController refreshController = RefreshController(initialRefresh: true);
  DateTime requestTime = DateTime.now();
  final newsList = <AutoIndexModel>[].obs;

  // initialRefresh = true 时 不需要主动调用
  void onRefresh() async {
    DateTime currentTime = DateTime.now();
    if (newsList.length < 20 || currentTime.isAfter(requestTime)) {
      HomeSwiperApi().request().then((value) {
        if (value.success == true) {
          AutoIndexResponseModel? responseModel = value.data;
          if (responseModel?.code == 200 && responseModel?.newslist != null) {
            newsList.value = responseModel?.newslist ?? [];
            requestTime = DateTime.now().add(const Duration(minutes: 120));
            newsList.refresh();
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
            osstpLogger.e(value.data?.msg);
            LoadingWidget.showError(status: '服务端数据异常');
          }
        } else {
          refreshController.refreshFailed();
          osstpLogger.e(value.errorMessage);
          LoadingWidget.showError(status: '数据解析异常');
        }
      });
    } else {
      // monitor network fetch
      await Future.delayed(const Duration(milliseconds: 2000));
      osstpLogger.w("模拟刷新");
      refreshController.refreshCompleted();
    }
  }

  void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    refreshController.loadNoData();
  }

  @override
  void onInit() {
    super.onInit();
    // onRefresh();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
  }

  @override
  Future<bool> didPushRoute(String route) {
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    return super.didPopRoute();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
