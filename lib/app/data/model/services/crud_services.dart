import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/user_image_profile/views/user_image_profile_view.dart';
import '../../../widgets/animations.dart';
import '../../../widgets/card/card_for_show_user_recipe.dart';

class CrudMethods {
  final userId = FirebaseFirestore.instance.collection('user recipe').doc().id;

  Future<void> setREcipe(String imageUrl, String foodName, String howToCook, String listofProducts, bool visible) {
    return FirebaseFirestore.instance
        .collection('user recipe')
        .doc(userId)
        .set({'userId': userId, 'imageUrl': imageUrl, 'foodName': foodName, 'howToCook': howToCook, 'listofProducts': listofProducts, 'isVisible': visible});
  }

  Future<void> removeData(id) {
    return FirebaseFirestore.instance.collection('user recipe').doc(id).delete().then((value) {
      print(userId);
    });
  }

  FutureBuilder<QuerySnapshot<Map<String, dynamic>>> futureforUser(bool bool) {
    final firestore = FirebaseFirestore.instance;
    final qr = firestore.collection('user recipe').where('isVisible', isEqualTo: true).get();

    return FutureBuilder(
      future: qr,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loading();
        } else if (snapshot.hasError) {
          return loading();
        } else {
          final data1 = snapshot.data!.docs;

          return SizedBox(
            height: Get.size.height,
            width: Get.size.width,
            child: ListView.builder(
              reverse: false,
              itemCount: data1.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return userRecipeCard(data1, index, context, true, false);
              },
            ),
          );
        }
      },
    );
  }

  GestureDetector userRecipeCard(List<QueryDocumentSnapshot<Map<String, dynamic>>> data1, int index, BuildContext context, bool verical, bool needTCancel) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => UserImageProfileView(
            imageUrl: data1[index]['imageUrl'],
            foodName: data1[index]['foodName'],
            index: index,
            ingredient: data1[index]['listofProducts'],
            instruction: data1[index]['howToCook'],
            needToCancel: false,
          ),
        );
      },
      child: cardForShowRecipe(index, verical, context, data1[index]['imageUrl'], data1[index]['foodName']),
    );
  }
}
