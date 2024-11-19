import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_34/Controller/BottomNavController.dart';

class Appbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}