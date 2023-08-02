import 'package:food_recipe_app/app/core/colors.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePageController extends GetxController {
  GetStorage storage = GetStorage();
  var selectedImagePath = ''.obs;
  void getIMageForProfile(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: imageSource);

    if (image != null) {
      selectedImagePath.value = image.path;
    } else {
      Get.snackbar('Surat saylanylmady', 'Suraty girizmek ucin tazeden saylan', backgroundColor: AppColors().whiteBlurColor);
    }
  }
}
