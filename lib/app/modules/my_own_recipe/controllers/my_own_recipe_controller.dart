import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyOwnRecipeController extends GetxController {
  RxList listOfUrls = [].obs;
  GetStorage storage = GetStorage();
  dynamic addImageMyOwnRecipe({
    required String imageUrl,
    required String foodName,
    required String howToCook,
    required String listOfProducts,
  }) async {
    listOfUrls.add({
      'imageUrl': imageUrl,
      'foodName': foodName,
      'howToCook': howToCook,
      'listOfProducts': listOfProducts,
    });
    listOfUrls.refresh();
    final jsonString = jsonEncode(listOfUrls);
    await storage.write('listOfUrls', jsonString);
  }

  dynamic removeImageMyOwnRecipe({
    required String imageUrl,
    required String foodName,
    required String howToCook,
    required String listOfProducts,
  }) async {
    if (listOfUrls.isEmpty) {
      Get.snackbar('hellow', 'isempty');
    } else {
      listOfUrls.removeWhere(
        (element) => element['imageUrl'] == imageUrl && element['foodName'] == foodName && element['howToCook'] == howToCook && element['listOfProducts'] == listOfProducts,
      );
    }
    listOfUrls.refresh();
    final jsonString = jsonEncode(listOfUrls);
    await storage.write('listOfUrls', jsonString);
  }

  dynamic returnImageMyOwnRecipe() async {
    final result = await storage.read('listOfUrls') ?? [];
    final List<dynamic> jsonData = jsonDecode(result.toString());
    for (int i = 0; i < jsonData.length; i++) {
      addImageMyOwnRecipe(
        imageUrl: jsonData[i]['imageUrl'],
        foodName: jsonData[i]['foodName'],
        howToCook: jsonData[i]['howToCook'],
        listOfProducts: jsonData[i]['listOfProducts'],
      );
    }
  }
}
