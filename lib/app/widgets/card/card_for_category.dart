import 'package:flutter/material.dart';
import 'package:food_recipe_app/app/core/colors.dart';
import 'package:food_recipe_app/app/core/constant_list.dart';
import 'package:food_recipe_app/app/core/constants.dart';
import 'package:food_recipe_app/app/widgets/text_for_home_page.dart';
import 'package:get/get.dart';

import '../../modules/category_image/views/category_image_view.dart';

GestureDetector categoryContainer(int largeSize, int index, BuildContext context, title) {
  return GestureDetector(
    onTap: () {
      Get.to(
        () => CategoryImageView(
          title: title,
        ),
      );
    },
    child: Container(
      height: 70,
      width: 105,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors().lilyColor1.withOpacity(.1),
        borderRadius: borderRadius15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/category/category${index + 1}.png',
            height: 35,
            width: 35,
          ),
          textForHomePage(
            context,
            title,
            14,
            false,
            Theme.of(context).colorScheme.onSecondary,
            true,
            true,
          )
        ],
      ),
    ),
  );
}

SizedBox cardCaegoryListView() {
  return SizedBox(
    width: Get.size.width,
    height: 90,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: categoryTitle.length - 1,
      itemBuilder: (BuildContext context, int index) {
        return categoryContainer(
          1,
          index,
          context,
          categoryTitle[index],
        );
      },
    ),
  );
}
