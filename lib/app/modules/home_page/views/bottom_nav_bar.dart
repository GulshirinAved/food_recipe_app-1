import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:food_recipe_app/app/core/colors.dart';
import 'package:food_recipe_app/app/modules/fav_page/controllers/fav_page_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/constant_list.dart';
import '../../my_own_recipe/controllers/my_own_recipe_controller.dart';
import '../controllers/home_controller.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  HomeController homeController = Get.put(HomeController());
  FavPageController controllerfav = Get.put(FavPageController());
  MyOwnRecipeController myOwnRecipeController = Get.put(MyOwnRecipeController());
  GetStorage storage = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerfav.returnFav();
    myOwnRecipeController.returnImageMyOwnRecipe();
    storage.read('user');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => pages[homeController.tabINdex.value],
        ),
        bottomNavigationBar: Obx(
          () => FlashyTabBar(
            backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            height: 55,
            selectedIndex: homeController.tabINdex.value,
            showElevation: true,
            animationDuration: const Duration(milliseconds: 650),
            items: [
              FlashyTabBarItem(activeColor: AppColors().lilyColor1, inactiveColor: AppColors().lilyColor1.withOpacity(.5), icon: const Icon(IconlyLight.home), title: const Text('Home')),
              FlashyTabBarItem(activeColor: AppColors().lilyColor1, inactiveColor: AppColors().lilyColor1.withOpacity(.5), icon: const Icon(IconlyLight.heart), title: const Text('Favorites')),
              FlashyTabBarItem(activeColor: AppColors().lilyColor1, inactiveColor: AppColors().lilyColor1.withOpacity(.5), icon: const Icon(IconlyLight.paper), title: const Text('Recipes')),
              FlashyTabBarItem(activeColor: AppColors().lilyColor1, inactiveColor: AppColors().lilyColor1.withOpacity(.5), icon: const Icon(IconlyLight.profile), title: const Text('Profile')),
            ],
            onItemSelected: (int index) {
              return homeController.cHangeTabIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
