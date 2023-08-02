import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/app/core/colors.dart';
import 'package:food_recipe_app/app/widgets/animations.dart';
import 'package:food_recipe_app/app/widgets/app_bar/appbar_home_page.dart';
import 'package:food_recipe_app/app/widgets/card/new_recipe.dart';

import 'package:get/get.dart';

import '../controllers/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  final String title;
  const SearchPageView({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHomePage(context, false, title.toUpperCase()),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Recipe').where('name', isGreaterThanOrEqualTo: title.toLowerCase()).where('name', isLessThan: '${title.toLowerCase()}z').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loading();
          } else if (snapshot.hasError) {
            return loading();
          } else if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 190,
              ),
              itemBuilder: (BuildContext context, int index) {
                return snapshot.data!.docs.isEmpty
                    ? Center(
                        child: Text(
                          'No recipe found',
                          style: TextStyle(color: AppColors().whiteColor),
                        ),
                      )
                    : cardForNewRecipe(
                        context,
                        snapshot.data!.docs[index]['image'][0],
                        snapshot.data!.docs[index]['name'],
                        snapshot.data!.docs[index]['video'],
                        snapshot.data!.docs[index]['ingredient'],
                        snapshot.data!.docs[index]['instruction'],
                        snapshot.data!.docs[index]['image'],
                        index,
                      );
              },
            );
          } else {
            return Center(
              child: Text(
                'No recipe found',
                style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
              ),
            );
          }
        },
      ),
    );
  }
}
