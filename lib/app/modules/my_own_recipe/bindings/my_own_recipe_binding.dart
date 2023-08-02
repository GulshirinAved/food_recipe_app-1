import 'package:get/get.dart';

import '../controllers/my_own_recipe_controller.dart';

class MyOwnRecipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyOwnRecipeController>(
      () => MyOwnRecipeController(),
    );
  }
}
