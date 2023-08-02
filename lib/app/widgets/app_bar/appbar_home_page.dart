import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/app/widgets/text_for_home_page.dart';

import '../../core/constants.dart';

AppBar appBarHomePage(context, bool testing, String title) {
  return AppBar(
    elevation: 0,
    title: testing == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 7.h, bottom: 7.h),
                child: Image.asset(
                  'assets/logo/1.png',
                  height: 50.h,
                  width: 41.w,
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                'Hot Recipe',
                style: TextStyle(
                  fontFamily: fontGilroy,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          )
        : textForHomePage(
            context,
            title,
            20,
            false,
            Theme.of(context).colorScheme.onSecondary,
            true,
            true,
          ),
    centerTitle: true,
  );
}
