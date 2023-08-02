import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';
import '../animations.dart';
import '../text_for_home_page.dart';

Container cardForShowRecipe(int index, bool verical, BuildContext context, String image, String name) {
  return Container(
    padding: const EdgeInsets.all(5),
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        ClipRRect(
          borderRadius: borderRadius20,
          child: CachedNetworkImage(
            imageUrl: image,
            height: verical == false ? 160 : 200,
            width: verical == false ? 270 : Get.size.width,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return loading();
            },
          ),
        ),
        Positioned.fill(
          bottom: verical == false ? 40 : 20,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 30, top: 5, bottom: 5, right: 30),
              decoration: BoxDecoration(
                color: AppColors().whiteColor,
                borderRadius: borderRadius20.copyWith(topLeft: const Radius.circular(0), bottomLeft: const Radius.circular(0)),
              ),
              child: textForHomePage(context, name, 16, true, AppColors().lilyColor1, true, false),
            ),
          ),
        )
      ],
    ),
  );
}
