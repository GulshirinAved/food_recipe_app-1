import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:food_recipe_app/app/core/colors.dart';
import 'package:food_recipe_app/app/core/constants.dart';
import 'package:food_recipe_app/app/modules/my_own_recipe/controllers/my_own_recipe_controller.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:food_recipe_app/app/widgets/card/stack_dialog.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../data/model/services/crud_services.dart';
import '../../../widgets/animations.dart';
import '../../../widgets/app_bar/app_bar_for_pages.dart';
import '../controllers/user_image_profile_controller.dart';

class UserImageProfileView extends GetView<UserImageProfileController> {
  String imageUrl;
  String foodName;
  String ingredient;
  String instruction;
  int index;
  bool needToCancel;
  UserImageProfileView({
    Key? key,
    required this.imageUrl,
    required this.foodName,
    required this.ingredient,
    required this.instruction,
    required this.index,
    required this.needToCancel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final key = GlobalObjectKey<ExpandableFabState>(context);
    MyOwnRecipeController myOwnRecipeController = Get.put(MyOwnRecipeController());

    return Scaffold(
      appBar: appBarForPages(context, foodName),
      body: CachedNetworkImage(
        imageUrl: imageUrl,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return loading();
        },
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        foregroundColor: AppColors().whiteColor,
        backgroundColor: AppColors().lilyColor1,
        closeButtonStyle: ExpandableFabCloseButtonStyle(backgroundColor: AppColors().lilyColor1.withOpacity(.5)),
        key: key,
        overlayStyle: ExpandableFabOverlayStyle(blur: 5),
        children: [
          FloatingActionButton.small(
            heroTag: 'first',
            backgroundColor: AppColors().lilyColor1.withOpacity(.5),
            onPressed: () {
              _showDialog(context, instruction);
            },
            child: Icon(
              IconlyLight.buy,
              color: AppColors().whiteColor,
            ),
          ),
          FloatingActionButton.small(
            heroTag: 'second',
            backgroundColor: AppColors().lilyColor1.withOpacity(.5),
            onPressed: () {
              _showDialog(context, ingredient);
            },
            child: Icon(
              IconlyLight.document,
              color: AppColors().whiteColor,
            ),
          ),
          needToCancel
              ? FutureBuilder(
                  future: FirebaseFirestore.instance.collection('user recipe').get(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                    return FloatingActionButton.small(
                      heroTag: 'third',
                      backgroundColor: AppColors().lilyColor1.withOpacity(.5),
                      onPressed: () {
                        CrudMethods().removeData(snapshot.data?.docs[index]['userId']).then((value) {
                          myOwnRecipeController.removeImageMyOwnRecipe(
                            imageUrl: imageUrl,
                            foodName: foodName,
                            howToCook: instruction,
                            listOfProducts: ingredient,
                          );
                          Get.back();
                        });
                      },
                      child: Icon(
                        Icons.remove,
                        color: AppColors().whiteColor,
                      ),
                    );
                  },
                )
              : Container()
        ],
      ),
    );
  }
}

void _showDialog(context, title) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: AppColors().lilyColor1.withOpacity(.5),
        shape: RoundedRectangleBorder(borderRadius: borderRadius15),
        child: stackDialog(context, title),
      );
    },
  );
}
