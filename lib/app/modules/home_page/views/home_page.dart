import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/app/widgets/card/card_for_category.dart';
import 'package:food_recipe_app/app/widgets/card/card_for_dialy_recipe.dart';
import 'package:food_recipe_app/app/widgets/card/card_for_level_recipe.dart';
import 'package:food_recipe_app/app/widgets/card/card_for_video.dart';
import 'package:get/get.dart';

import 'package:food_recipe_app/app/modules/home_page/views/all_view.dart';
import 'package:food_recipe_app/app/widgets/app_bar/appbar_home_page.dart';
import 'package:food_recipe_app/app/widgets/card/new_recipe.dart';
import 'package:paginate_firestore/bloc/pagination_listeners.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

import '../../../core/colors.dart';
import '../../../core/constants.dart';
import '../../../widgets/text_field/text_field_ui.dart';
import '../../../widgets/text_for_home_page.dart';
import 'category_all_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHomePage(context, true, 'Hot Recipe'),
      body: ListView(
        children: [
          textFieldHomePage(context),
          homePageText(
            context,
            'Categories',
            () {
              Get.to(() => const CategoryAllView());
            },
            Theme.of(context).colorScheme.background,
          ),
          cardCaegoryListView(),
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: Column(
              children: [
                homePageText(
                  context,
                  'Video',
                  () {
                    Get.to(
                      () => AllView(
                        title: 'video',
                        listName: 'video',
                      ),
                    );
                  },
                  Theme.of(context).colorScheme.background,
                ),
                futureForAll('video', 'video'),
                homePageText(
                  context,
                  'New added recipes',
                  () {
                    Get.to(
                      () => AllView(
                        title: 'New added recipes',
                        listName: 'New added recipes',
                      ),
                    );
                  },
                  Theme.of(context).colorScheme.background,
                ),
                futureForAll('New added recipes', 'New added recipes'),
                homePageText(
                  context,
                  'Dialy recipes',
                  () {
                    Get.to(
                      () => AllView(
                        title: 'Dialy recipes',
                        listName: 'Dialy recipes',
                      ),
                    );
                  },
                  Theme.of(context).colorScheme.background,
                ),
                futureForAll('Dialy recipes', 'Dialy recipes'),
                homePageText(
                  context,
                  'Easy recipes',
                  () {
                    Get.to(
                      () => AllView(
                        title: 'Easy Recipe',
                        listName: 'Easy Recipe',
                      ),
                    );
                  },
                  Theme.of(context).colorScheme.background,
                ),
                futureForAll('Easy Recipe', 'Easy recipes'),
                homePageText(
                  context,
                  'Hard recipes',
                  () {
                    Get.to(
                      () => AllView(
                        title: 'Hard Recipe',
                        listName: 'Hard recipe',
                      ),
                    );
                  },
                  Theme.of(context).colorScheme.background,
                ),
                futureForAll('Hard Recipe', 'Hard recipe'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

SizedBox futureForAll(String title, String listName) {
  final firestore = FirebaseFirestore.instance;
  final qr = firestore.collection('Recipe').where('category', arrayContains: title).get();
  PaginateRefreshedChangeListener refreshChangeListener = PaginateRefreshedChangeListener();

  return SizedBox(
    height: listName == 'video' ? 100 : 175.h,
    child: RefreshIndicator(
      onRefresh: () async {
        refreshChangeListener.refreshed = true;
      },
      child: PaginateFirestore(
        itemsPerPage: 10,
        itemBuilderType: PaginateBuilderType.listView,
        scrollDirection: Axis.horizontal,
        query: FirebaseFirestore.instance.collection('Recipe').where('category', arrayContains: title),
        listeners: [
          refreshChangeListener,
        ],
        itemBuilder: (context, documentSnapshots, index) {
          final doc = documentSnapshots[index].data() as Map?;
          return listName == 'New added recipes'
              ? cardForNewRecipe(
                  context,
                  doc!['image'][0],
                  doc['name'],
                  doc['video'],
                  doc['ingredient'],
                  doc['instruction'],
                  doc['image'],
                  index,
                )
              : listName == 'Dialy recipes'
                  ? cardForeDialyRecipeView(
                      context,
                      doc!['image'][0],
                      doc['name'],
                      doc['video'],
                      doc['ingredient'],
                      doc['instruction'],
                      doc['image'],
                      index,
                    )
                  : listName == 'video'
                      ? containerCardForVideo(
                          context,
                          doc!['image'][0],
                          doc['name'],
                          doc['video'],
                          doc['video time'],
                        )
                      : cardForEasyLevel(
                          context,
                          doc!['image'][0],
                          doc['name'],
                          doc['video'],
                          doc['ingredient'],
                          doc['instruction'],
                          doc['image'],
                          index,
                        );
        },
      ),
    ),
  );
}

Stack userContainerCategory(List<QueryDocumentSnapshot<Map<String, dynamic>>> data1, int index, BuildContext context) {
  return Stack(
    children: [
      Container(
        height: 100,
        width: 105,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors().lilyColor1.withOpacity(.1),
          borderRadius: borderRadius15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: borderRadius10,
              child: Image.network(
                data1[index]['image'],
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            textForHomePage(
              context,
              data1[index]['name'],
              14,
              false,
              AppColors().blackColor,
              true,
              true,
            )
          ],
        ),
      ),
    ],
  );
}
