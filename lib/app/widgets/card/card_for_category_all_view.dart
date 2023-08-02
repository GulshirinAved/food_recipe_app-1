import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant_list.dart';
import '../../modules/home_page/controllers/home_controller.dart';
import 'card_for_category.dart';

Padding cardForCategoryAllView() {
  HomeController homeController = Get.put(HomeController());
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: categoryTitle.length - 1,
      itemBuilder: (BuildContext context, int index) {
        return categoryContainer(
          2,
          index,
          context,
          categoryTitle[index],
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 100,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    ),
  );
}
