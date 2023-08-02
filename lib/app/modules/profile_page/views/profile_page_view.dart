import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:food_recipe_app/app/core/constants.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:food_recipe_app/app/core/colors.dart';
import 'package:food_recipe_app/app/data/model/services/theme_service.dart';

import '../../../widgets/app_bar/appbar_home_page.dart';
import '../../../widgets/buttons/icon_button.dart';
import '../controllers/profile_page_controller.dart';
import 'about_us.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  ProfilePageController profileController = Get.put(ProfilePageController());
  ProfilePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().lilyColor.withOpacity(.02),
      appBar: appBarHomePage(context, false, 'Profile'),
      body: ListView(
        children: [
          Column(
            children: [
              profileIconButton(
                context,
                CupertinoIcons.moon_stars,
                'Dark Mode',
                () {
                  ThemeService().changeThemeMode();
                },
                true,
              ),
              profileIconButton(
                context,
                IconlyBold.send,
                'Share with friends',
                () async {
                  return await Share.share(appShareLink, subject: 'I will cook');
                },
                true,
              ),
              profileIconButton(
                context,
                IconlyBold.message,
                'Feedback',
                () {
                  launchUrlString('mailto:avediyeva@gmail.com?subject= &body=');
                },
                true,
              ),
              profileIconButton(
                context,
                IconlyLight.infoSquare,
                'About us',
                () {
                  Get.to(() => const AboutUs());
                },
                true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
