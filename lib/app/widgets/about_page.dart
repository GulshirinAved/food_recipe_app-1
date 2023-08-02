import 'package:flutter/material.dart';
import 'package:food_recipe_app/app/core/constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

ListTile aboutPageWidget(String name, IconData icon, BuildContext context) {
  return ListTile(
    onTap: () {
      launchUrlString('mailto:avediyeva@gmail.com?subject= &body=');
    },
    leading: Icon(
      icon,
      color: Theme.of(context).colorScheme.background,
    ),
    title: Text(
      name,
      style: TextStyle(
        fontFamily: fontGilroy,
        color: Theme.of(context).colorScheme.background,
      ),
    ),
  );
}
