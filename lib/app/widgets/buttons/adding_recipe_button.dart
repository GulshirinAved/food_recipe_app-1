import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';
import '../text_for_home_page.dart';

GestureDetector buttonForAddingRecipe(BuildContext context, VoidCallback onTap, String title, double width, double height, Color titleColor) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: AppColors().lilyColor1.withOpacity(.9), borderRadius: borderRadius20),
      child: Center(child: textForHomePage(context, title, 15, false, AppColors().whiteColor, true, true)),
    ),
  );
}
