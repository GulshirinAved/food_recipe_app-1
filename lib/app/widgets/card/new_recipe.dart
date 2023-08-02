import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/app/core/constants.dart';
import 'package:food_recipe_app/app/modules/image_profile/views/image_profile_view.dart';
import 'package:get/get.dart';

import '../animations.dart';
import '../text_for_home_page.dart';

GestureDetector cardForNewRecipe(
  BuildContext context,
  String imageUrl,
  String imageTitle,
  String video,
  String ingredient,
  String instruction,
  List imageList,
  int index,
) {
  return GestureDetector(
    onTap: () {
      Get.to(
        () => ImageProfileView(
          imageName: imageTitle,
          ingredient: ingredient,
          instruction: instruction,
          video: video,
          imageUrl: imageUrl,
          imageList: imageList,
          index: index,
        ),
      );
    },
    child: Container(
      width: 180,
      decoration: BoxDecoration(
        borderRadius: borderRadius20,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: borderRadius20,
            child: Opacity(
              opacity: .95,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 160,
                width: 155,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return loading();
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: textForHomePage(context, imageTitle.toUpperCase(), 20, false, Theme.of(context).colorScheme.onSecondary, true, true),
          ),
        ],
      ),
    ),
  );
}
