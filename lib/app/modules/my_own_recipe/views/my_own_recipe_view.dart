import 'package:flutter/material.dart';
import 'package:food_recipe_app/app/core/colors.dart';
import 'package:food_recipe_app/app/widgets/app_bar/appbar_home_page.dart';
import 'package:food_recipe_app/app/widgets/card/card_user_added_recipes.dart';

import 'package:get/get.dart';

import '../../../widgets/buttons/adding_recipe_button.dart';
import '../controllers/my_own_recipe_controller.dart';
import 'add_recipe_page.dart';

class MyOwnRecipeView extends StatefulWidget {
  const MyOwnRecipeView({
    Key? key,
  }) : super(key: key);

  @override
  State<MyOwnRecipeView> createState() => _MyOwnRecipeViewState();
}

class _MyOwnRecipeViewState extends State<MyOwnRecipeView> {
  MyOwnRecipeController myOwnRecipeController = Get.put(MyOwnRecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHomePage(context, false, 'Users added recipes '),
      body: verticalMyRecipeCard(),
      floatingActionButton: buttonForAddingRecipe(
        context,
        () {
          Get.to(
            () => const AddRecipePage(),
          );
        },
        'to add',
        110,
        50,
        AppColors().whiteColor,
      ),
    );
  }
}
