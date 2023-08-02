import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/app/modules/video_player/views/video_player_view.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../animations.dart';
import '../text_for_home_page.dart';

GestureDetector containerCardForVideo(BuildContext context, String image, String title, String video, String videoTime) {
  return GestureDetector(
    onTap: () {
      Get.to(() => VideoPlayerView(title: title, video: video));
    },
    child: Container(
      margin: EdgeInsets.only(right: 10.w, left: 10.w, bottom: 10),
      height: 75.h,
      width: 235.w,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.onBackground.withOpacity(.6), borderRadius: borderRadius15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: borderRadius15,
            child: CachedNetworkImage(
              placeholder: (context, url) {
                return loading();
              },
              imageUrl: image,
              height: 70,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: Get.size.width - 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textForHomePage(
                  context,
                  title.toUpperCase(),
                  12,
                  false,
                  Theme.of(context).colorScheme.background,
                  true,
                  false,
                ),
                textForHomePage(
                  context,
                  videoTime,
                  12,
                  true,
                  Theme.of(context).colorScheme.background,
                  true,
                  false,
                ),
              ],
            ),
          ),
          playAnimation()
        ],
      ),
    ),
  );
}
