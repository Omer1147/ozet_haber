import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ozet_haber/constants/colors_const.dart';
import 'package:ozet_haber/controllers/font_size_controller.dart';

class NewsSourceText extends StatelessWidget {
  final String data;
  NewsSourceText(this.data,{super.key});

  final FontSizeController fontSizeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
      data,
      style: TextStyle(
        color: ColorsConst.lightGray,
        fontSize: fontSizeController.baseFontSize.value.sp,
      )
    ));
  }
}