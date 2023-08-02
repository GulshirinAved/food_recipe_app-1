import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var tabINdex = 0.obs;
  final islarge = false.obs;
  RxList products = [].obs;
  final storage = GetStorage();

  void cHangeTabIndex(int index) {
    tabINdex.value = index;
    update();
  }

  void getCAtegory() {
    islarge.value = true;
    update();
  }
}
