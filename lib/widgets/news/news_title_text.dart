import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ozet_haber/controllers/font_size_controller.dart';

class NewsTitleText extends StatelessWidget {
  final String data;
  NewsTitleText(this.data,{super.key});

  final FontSizeController fontSizeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
      data,
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: (fontSizeController.baseFontSize.value * 1.3).sp,
        fontWeight: FontWeight.bold),
    ));
  }
}