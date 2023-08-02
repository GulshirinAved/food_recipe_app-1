import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/app/data/model/services/crud_services.dart';

FutureBuilder<QuerySnapshot<Map<String, dynamic>>> verticalMyRecipeCard() {
  return CrudMethods().futureforUser(false);
  // return SizedBox(
  //   height: Get.size.height,
  //   width: Get.size.width,
  //   child: Obx(() {
  //     return ListView.builder(
  //       reverse: false,
  //       itemCount: myOwnRecipeController.listOfUrls.length,
  //       shrinkWrap: true,
  //       scrollDirection: Axis.vertical,
  //       itemBuilder: (BuildContext context, int index) {
  //         return GestureDetector(
  //           onTap: () {
  //             Get.to(
  //               () => UserImageProfileView(
  //                 imageUrl: myOwnRecipeController.listOfUrls[index]['imageUrl'],
  //                 foodName: myOwnRecipeController.listOfUrls[index]['foodName'],
  //                 index: index,
  //                 ingredient: myOwnRecipeController.listOfUrls[index]['listOfProducts'],
  //                 instruction: myOwnRecipeController.listOfUrls[index]['howToCook'],
  //                 needToCancel: true,
  //               ),
  //             );
  //           },
  //           child: cardForShowRecipe(index, true, context, myOwnRecipeController.listOfUrls[index]['imageUrl'], myOwnRecipeController.listOfUrls[index]['foodName']),
  //         );
  //       },
  //     );
  //   }),
  // );
}
