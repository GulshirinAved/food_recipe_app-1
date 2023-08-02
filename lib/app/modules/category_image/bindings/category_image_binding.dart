import 'package:get/get.dart';

import '../controllers/category_image_controller.dart';

class CategoryImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryImageController>(
      () => CategoryImageController(),
    );
  }
}
