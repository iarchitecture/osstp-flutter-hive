import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class InitialErrorPage extends StatelessWidget {
  final String? errorMsg;

  const InitialErrorPage({Key? key, this.errorMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "OSSTP WIDGET",
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
            child: ElevatedButton(
                onPressed: () {
                  exit(0);
                },
                child: const Text("CLOSE")),
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
                    "App出现错误\n请截图发到邮箱1361016291@qq.com",
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
