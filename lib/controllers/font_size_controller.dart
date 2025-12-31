import 'package:get/get.dart';

class FontSizeController extends GetxController {
  RxDouble baseFontSize = 13.0.obs;

  void changeFontSize(double newSize) {
    baseFontSize.value = newSize;
  }
}