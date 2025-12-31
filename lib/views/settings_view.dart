import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ozet_haber/constants/texts_const.dart';
import 'package:ozet_haber/constants/titles_const.dart';
import 'package:ozet_haber/controllers/font_size_controller.dart';
import 'package:ozet_haber/widgets/appbar_title.dart';
import 'package:ozet_haber/widgets/drawer_menu.dart';
import 'package:ozet_haber/widgets/text/large_text.dart';
import 'package:ozet_haber/widgets/text/medium_text.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final FontSizeController fontSizeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitle(TitlesConst.settingsViewTitle),
          centerTitle: true,  
        ),

        drawer: DrawerMenu(),

        body: Column(
        children: [
          LargeText(TextsConst.adjustFontSize),
          Obx(() => Slider(
            min: 11.0,
            max: 16.0,
            value: fontSizeController.baseFontSize.value,
            onChanged: (double newValue) {
              fontSizeController.changeFontSize(newValue);
            },
          )),
          Obx(() => MediumText("${TextsConst.fontSize} ${fontSizeController.baseFontSize.value.toStringAsFixed(1)}")),
        ]),
      )
    );
  }
}