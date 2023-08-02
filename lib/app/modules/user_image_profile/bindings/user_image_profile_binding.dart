import 'package:get/get.dart';

import '../controllers/user_image_profile_controller.dart';

class UserImageProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserImageProfileController>(
      () => UserImageProfileController(),
    );
  }
}
