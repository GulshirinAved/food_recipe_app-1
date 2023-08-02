import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

import '../../core/colors.dart';
import '../text_for_home_page.dart';

AppBar appBarForPages(BuildContext context, String title) {
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
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        IconlyLight.arrowLeft3,
        color: AppColors().lilyColor1,
      ),
    ),
    centerTitle: true,
  );
}
