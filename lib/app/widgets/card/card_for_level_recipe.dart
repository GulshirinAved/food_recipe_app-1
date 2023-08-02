import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/app/widgets/animations.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../../modules/image_profile/views/image_profile_view.dart';
import '../text_for_home_page.dart';

GestureDetector cardForEasyLevel(BuildContext context, String imageUrl, String title, String video, String ingredient, String instruction, List imageList, final int index) {
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
      height: 160.h,
      width: 130.w,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: borderRadius20,
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
            height: 100.h,
            width: 154.w,
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.only(
              bottom: 10.h,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: ClipRRect(
              borderRadius: borderRadius10,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
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
            18,
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
