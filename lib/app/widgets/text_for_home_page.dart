import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/app/core/colors.dart';
import 'package:food_recipe_app/app/core/constants.dart';

Text textForHomePage(BuildContext context, String title, int fontSize, bool isBold, Color color, bool needEllipsis, bool isCenter) {
  return Text(
    title,
    overflow: needEllipsis ? TextOverflow.ellipsis : TextOverflow.visible,
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
    style: TextStyle(
      color: color,
      fontFamily: fontGilroyMediumFont,
      fontSize: fontSize.sp,
      fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
    ),
  );
}

Padding homePageText(BuildContext context, String title, VoidCallback onTap, Color color) {
  return Padding(
    padding: EdgeInsets.only(left: 9.w, top: 8.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textForHomePage(context, title, 23, false, color, true, true),
        IconButton(
          onPressed: onTap,
          icon: Icon(
            IconlyLight.arrowRightCircle,
            color: AppColors().lilyColor,
          ),
        )
      ],
    ),
  );
}
