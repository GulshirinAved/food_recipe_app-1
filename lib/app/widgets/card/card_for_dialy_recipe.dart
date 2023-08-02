import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/app/widgets/animations.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/constants.dart';
import '../../modules/image_profile/views/image_profile_view.dart';
import '../text_for_home_page.dart';

GestureDetector cardForeDialyRecipeView(BuildContext context, String imageUrl, String title, String video, String ingredient, String instruction, List imageList, int index) {
  return GestureDetector(
    onTap: () {
      Get.to(
        () => ImageProfileView(
          imageName: title,
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
      height: 120.h,
      width: 130.w,
      margin: const EdgeInsets.all(
        5,
      ),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: borderRadius30,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).cardTheme.color!.withOpacity(.5),
            offset: const Offset(0, 10),
            blurRadius: 20,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 8.h, bottom: 6.h),
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: borderRadius30),
            child: ClipRRect(
              borderRadius: borderRadius25,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 100,
                width: 110,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return loading();
                },
              ),
            ),
          ),
          textForHomePage(
            context,
            title.toUpperCase(),
            16,
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
