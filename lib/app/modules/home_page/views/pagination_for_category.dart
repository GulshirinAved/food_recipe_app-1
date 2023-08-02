import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/bloc/pagination_listeners.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

import '../../../widgets/card/card_for_level_recipe.dart';
import 'home_page.dart';

Padding paginationForCategory(String title, String listName) {
  PaginateRefreshedChangeListener refreshChangeListener = PaginateRefreshedChangeListener();

  return Padding(
    padding: const EdgeInsets.only(left: 7, right: 7),
    child: RefreshIndicator(
      onRefresh: () async {
        refreshChangeListener.refreshed = true;
      },
      child: PaginateFirestore(
        itemsPerPage: 10,
        itemBuilderType: PaginateBuilderType.gridView,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: listName == 'category' ? 2 : 3,
          crossAxisSpacing: listName == 'category' ? 34 : 20,
          mainAxisSpacing: listName == 'category' ? 10 : 20,
          mainAxisExtent: listName == 'category' ? 180 : 120,
        ),
        query: FirebaseFirestore.instance.collection('Recipe').where('category', arrayContains: title),
        listeners: [
          refreshChangeListener,
        ],
        itemBuilder: (context, documentSnapshots, index) {
          final doc = documentSnapshots[index].data() as Map?;
          return listName == 'userCategory'
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: doc!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return doc['isVisible'] == true ? userContainerCategory(doc as List<QueryDocumentSnapshot<Map<String, dynamic>>>, index, context) : Container();
                    },
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 120,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                  ),
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
