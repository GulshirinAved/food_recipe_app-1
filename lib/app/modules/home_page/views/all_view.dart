// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paginate_firestore/bloc/pagination_listeners.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

import 'package:food_recipe_app/app/modules/home_page/controllers/home_controller.dart';
import 'package:food_recipe_app/app/widgets/app_bar/app_bar_for_pages.dart';
import 'package:food_recipe_app/app/widgets/card/new_recipe.dart';

import '../../../widgets/card/card_for_dialy_recipe.dart';
import '../../../widgets/card/card_for_level_recipe.dart';
import '../../../widgets/card/card_for_video_all_view.dart';

class AllView extends StatelessWidget {
  final String title;
  final String listName;
  AllView({super.key, required this.title, required this.listName});
  HomeController homeController = Get.put(HomeController());
  PaginateRefreshedChangeListener refreshChangeListener = PaginateRefreshedChangeListener();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarForPages(context, title),
      body: Padding(
        padding: const EdgeInsets.only(left: 7, right: 7, top: 5),
        child: RefreshIndicator(
          onRefresh: () async {
            refreshChangeListener.refreshed = true;
          },
          child: PaginateFirestore(
            itemsPerPage: 10,
            itemBuilderType: PaginateBuilderType.gridView,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              mainAxisExtent: title == 'video'
                  ? 210
                  : title == 'New added recipes'
                      ? 205
                      : 180,
            ),
            query: FirebaseFirestore.instance.collection('Recipe').where('category', arrayContains: title).orderBy('orderby'),
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
                  : title == 'Dialy recipes'
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
                      : listName == 'Easy Recipe'
                          ? cardForEasyLevel(
                              context,
                              doc!['image'][0],
                              doc['name'],
                              doc['video'],
                              doc['ingredient'],
                              doc['instruction'],
                              doc['image'],
                              index,
                            )
                          : listName == 'Hard recipe'
                              ? cardForEasyLevel(
                                  context,
                                  doc!['image'][0],
                                  doc['name'],
                                  doc['video'],
                                  doc['ingredient'],
                                  doc['instruction'],
                                  doc['image'],
                                  index,
                                )
                              : cardForVideoAllView(
                                  context,
                                  doc!['image'][0],
                                  doc['name'],
                                  doc['video'],
                                );
            },
          ),
        ),
      ),
    );
  }
}
