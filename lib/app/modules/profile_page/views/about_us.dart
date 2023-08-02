import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:food_recipe_app/app/core/constants.dart';
import 'package:food_recipe_app/app/widgets/app_bar/appbar_home_page.dart';

import '../../../widgets/about_page.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHomePage(context, false, 'About us'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 10, left: 12),
            child: Text(
              'For Contacting:',
              style: TextStyle(color: Theme.of(context).colorScheme.background, fontFamily: fontGilroy, fontSize: 20),
            ),
          ),
          aboutPageWidget('avediyeva@gmail.com', IconlyLight.message, context),
        ],
      ),
    );
  }
}
