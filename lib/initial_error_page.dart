import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osstp_flutter_hive/common/widget/elevated_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class InitialErrorPage extends StatelessWidget {
  final String? errorMsg;

  const InitialErrorPage({Key? key, this.errorMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "HIVE",
      home: CustomErrorPage(msg: errorMsg),
    );
  }
}

class CustomErrorPage extends StatelessWidget {
  final String? msg;

  const CustomErrorPage({Key? key, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          "ERROR",
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            child: ElevatedButtonWidget.normal(
              backgroundColor: Colors.red,
              margin: const EdgeInsets.only(bottom: 50),
              titleText: const Text('反馈'),
              onPressed: () {
                String encodeQueryParameters(Map<String, String> params) {
                  return params.entries
                      .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                      .join('&');
                }

                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: '861528778@qq.com',
                  query: encodeQueryParameters(<String, String>{'subject': '[HIVE]崩溃信息', 'body': msg ?? ''}),
                );

                launchUrl(emailLaunchUri).then((bool value) {});
              },
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black87,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "请反馈下面崩溃信息",
                    style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(
                    msg ?? "",
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
