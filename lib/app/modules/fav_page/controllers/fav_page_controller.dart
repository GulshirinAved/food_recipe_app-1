import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavPageController extends GetxController {
  RxList products = [].obs;
  GetStorage storage = GetStorage();
  dynamic addFav(
    String image,
    String ingredient,
    String instruction,
    String name,
    String video,
    List imageForFav,
  ) async {
    products.add({'image': image, 'ingredient': ingredient, 'instruction': instruction, 'name': name, 'video': video, 'imageForFav': imageForFav});
    products.refresh();
    final jsonString = jsonEncode(products);
    await storage.write('products', jsonString);
  }

  dynamic removeFavItem(String url) async {
    if (products.isEmpty) {
      Get.snackbar('hello', 'isempty');
    } else {
      products.removeWhere((element) => element['image'] == url);
    }
    products.refresh();
    final jsonString = jsonEncode(products);
    await storage.write('products', jsonString);
  }

  dynamic returnFav() async {
    final result = await storage.read('products') ?? [];
    final List<dynamic> jsonData = jsonDecode(result.toString());
    for (int i = 0; i < jsonData.length; i++) {
      addFav(
        jsonData[i]['image'],
        jsonData[i]['ingredient'],
        jsonData[i]['instruction'],
        jsonData[i]['name'],
        jsonData[i]['video'],
        jsonData[i]['imageForFav'],
      );
    }
  }
}
