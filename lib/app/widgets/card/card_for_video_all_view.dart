import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../modules/video_player/views/video_player_view.dart';
import '../animations.dart';
import '../text_for_home_page.dart';

Column cardForVideoAllView(
  BuildContext context,
  String image,
  String title,
  String video,
) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Get.to(() => VideoPlayerView(title: title.toUpperCase(), video: video));
        },
        child: Container(
          height: 140.h,
          width: 150.w,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: AppColors().lilyColor.withOpacity(.1), borderRadius: borderRadius30),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: borderRadius30,
                  child: CachedNetworkImage(
                    placeholder: (context, url) {
                      return loading();
                    },
                    imageUrl: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 2,
                child: Align(
                  alignment: Alignment.topRight,
                  child: playAnimation(),
                ),
              ),
            ],
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
  );
}
