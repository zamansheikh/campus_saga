import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 1.obs;
  RxBool isDark = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
