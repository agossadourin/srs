import 'package:get/get.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;
  RxInt servicesSelectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
