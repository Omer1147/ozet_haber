import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ozet_haber/controllers/font_size_controller.dart';

class AppBarTitle extends StatelessWidget {
  final String data;
  AppBarTitle(this.data,{super.key});

  final FontSizeController fontSizeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
      data,
      style: TextStyle(
        fontSize: (fontSizeController.baseFontSize.value * 1.3).sp,
        fontWeight: FontWeight.bold,
      ),
    ));
  }
}