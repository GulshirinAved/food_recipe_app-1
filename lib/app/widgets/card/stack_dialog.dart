import 'package:flutter/material.dart';
import 'package:food_recipe_app/app/core/colors.dart';
import 'package:food_recipe_app/app/widgets/text_for_home_page.dart';
import 'package:get/get.dart';

Stack stackDialog(context, title) {
  return Stack(
    children: [
      SingleChildScrollView(child: cardDialog(context, title)),
      Positioned(
        top: 0,
        right: 0,
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.close),
        ),
      ),
    ],
  );
}

Padding cardDialog(context, title) {
  return Padding(
    padding: const EdgeInsets.all(70),
    child: textForHomePage(context, title, 20, true, AppColors().whiteColor, false, true),
  );
}
