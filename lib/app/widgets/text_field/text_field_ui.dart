import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:food_recipe_app/app/core/constants.dart';
import 'package:food_recipe_app/app/modules/search_page/views/search_page_view.dart';
import 'package:get/get.dart';
import '../../core/colors.dart';

Padding textFieldHomePage(context) {
  TextEditingController searchController = TextEditingController();
  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 5),
    child: TextField(
      controller: searchController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      autofocus: false,
      autocorrect: false,
      style: TextStyle(color: Theme.of(context).colorScheme.background, fontFamily: fontGilroy, fontWeight: FontWeight.bold),
      cursorColor: AppColors().lilyColor1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 7),
        filled: true,
        fillColor: Theme.of(context).cardTheme.color,
        alignLabelWithHint: true,
        hintText: 'Write here what you like to cook...',
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontFamily: fontGilroy,
          fontSize: 14,
        ),
        suffixIcon: Icon(
          IconlyBroken.search,
          color: AppColors().lilyColor,
          size: 22,
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadius15,
          borderSide: BorderSide(
            color: AppColors().transparentColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius15,
          borderSide: BorderSide(
            color: AppColors().transparentColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius15,
          borderSide: BorderSide(
            color: AppColors().transparentColor,
          ),
        ),
      ),
      onSubmitted: (value) {
        Get.to(
          () => SearchPageView(
            title: value,
          ),
        );
        searchController.clear();
      },
    ),
  );
}
