import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:food_recipe_app/app/modules/home_page/controllers/home_controller.dart';
import 'package:food_recipe_app/app/widgets/text_for_home_page.dart';
import 'package:get/get.dart';

import '../../core/colors.dart';

AppBar appbarForCategoryPage(BuildContext context, bool needAction, String title, VoidCallback onTap, IconData icon) {
  HomeController homeController = Get.put(HomeController());

  return AppBar(
    elevation: .1,
    title: textForHomePage(
      context,
      title,
      20,
      false,
      Theme.of(context).colorScheme.onSecondary,
      true,
      true,
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        IconlyLight.arrowLeft3,
        color: AppColors().lilyColor1,
      ),
    ),
    actions: needAction
        ? [
            Obx(
              () => IconButton(
                onPressed: () {
                  homeController.getCAtegory();
                  homeController.islarge.value = true;
                },
                icon: Icon(
                  IconlyLight.category,
                  color: homeController.islarge.value == false ? Theme.of(context).colorScheme.inversePrimary : AppColors().lilyColor1,
                  size: homeController.islarge.value == false ? 24 : 26,
                ),
              ),
            ),
            Obx(
              () => IconButton(
                onPressed: () {
                  homeController.getCAtegory();
                  homeController.islarge.value = false;
                },
                icon: Icon(
                  Icons.format_list_bulleted,
                  color: homeController.islarge.value == true ? Theme.of(context).colorScheme.inversePrimary : AppColors().lilyColor1,
                  size: homeController.islarge.value == true ? 26 : 28,
                ),
              ),
            )
          ]
        : [
            IconButton(
              onPressed: onTap,
              icon: Icon(
                icon,
                color: AppColors().lilyColor1,
              ),
            )
          ],
  );
}
