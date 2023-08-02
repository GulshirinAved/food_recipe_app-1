import 'package:get/get.dart';

import '../controllers/fav_page_controller.dart';

class FavPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavPageController>(
      () => FavPageController(),
    );
  }
}
