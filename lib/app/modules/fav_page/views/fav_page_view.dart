import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/app/core/colors.dart';
import 'package:food_recipe_app/app/core/constants.dart';
import 'package:food_recipe_app/app/modules/image_profile/views/image_profile_view.dart';
import 'package:food_recipe_app/app/widgets/animations.dart';

import 'package:get/get.dart';

import '../../../widgets/app_bar/appbar_home_page.dart';
import '../controllers/fav_page_controller.dart';

class FavPageView extends StatefulWidget {
  const FavPageView({
    Key? key,
  }) : super(key: key);

  @override
  State<FavPageView> createState() => _FavPageViewState();
}

class _FavPageViewState extends State<FavPageView> {
  final FavPageController favController = Get.put(FavPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHomePage(context, false, 'Favorites'),
      body: favController.products.isEmpty
          ? nolike(context)
          : Obx(
              () => GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: favController.products.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return favController.products.isNotEmpty
                      ? Obx(
                          () => GestureDetector(
                            onTap: () {
                              Get.to(
                                () => ImageProfileView(
                                  imageName: favController.products[index]['name'], //duzet merjimek durandyr. sen bolsa appbarda name at yagny naharyn ady name bolsa sony goymalysyn
                                  ingredient: favController.products[index]['ingredient'], instruction: favController.products[index]['instruction'],
                                  video: favController.products[index]['video'], imageUrl: favController.products[index]['image'],
                                  imageList: favController.products[index]['imageForFav'],
                                  index: index,

                                  //barde bolsa collection durandyr haysy kategoiya degisli bolsa sona tarap et
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius20,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors().blackColor.withOpacity(0.23),
                                        offset: const Offset(0, 10),
                                        blurRadius: 20,
                                      )
                                    ],
                                  ),
                                  margin: const EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                    bottom: 15,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: ClipRRect(
                                    borderRadius: borderRadius20,
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) {
                                        return loading();
                                      },
                                      imageUrl: favController.products[index]['image'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const Text('Error');
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              ),
            ),
    );
  }
}
