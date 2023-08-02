import 'package:flutter/material.dart';
import 'package:food_recipe_app/app/modules/home_page/views/pagination_for_category.dart';
import 'package:food_recipe_app/app/widgets/app_bar/appbar_home_page.dart';

import 'package:get/get.dart';

import '../controllers/category_image_controller.dart';

class CategoryImageView extends GetView<CategoryImageController> {
  String title;

  CategoryImageView({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHomePage(context, false, title),
      body: paginationForCategory(title, 'category'),
    );
  }
}
