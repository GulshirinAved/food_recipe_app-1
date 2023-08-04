import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

import 'package:food_recipe_app/app/core/colors.dart';
import 'package:food_recipe_app/app/core/constants.dart';
import 'package:food_recipe_app/app/modules/video_player/views/video_player_view.dart';
import 'package:food_recipe_app/app/widgets/animations.dart';
import 'package:food_recipe_app/app/widgets/buttons/favButton.dart';
import 'package:food_recipe_app/app/widgets/text_for_home_page.dart';
import 'package:share_plus/share_plus.dart';

import '../../../widgets/app_bar/app_bar_for_category.dart';
import '../controllers/image_profile_controller.dart';

class ImageProfileView extends GetView<ImageProfileController> {
  final String imageName;
  final String imageUrl;
  final String ingredient;
  final String instruction;
  final String video;
  final List imageList;
  final int index;

  const ImageProfileView({
    Key? key,
    required this.imageName,
    required this.imageUrl,
    required this.ingredient,
    required this.instruction,
    required this.video,
    required this.imageList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appbarForCategoryPage(
          context,
          false,
          imageName.toUpperCase(),
          () async {
            await Share.share('Ingredient:\n$ingredient\n Instrutuction:\n$instruction');
          },
          IconlyLight.send,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            CarouselSlider.builder(
              itemCount: imageList.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return ClipRRect(
                  borderRadius: borderRadius15,
                  child: CachedNetworkImage(
                    imageUrl: imageList[index],
                    height: 320,
                    width: Get.size.width - 29,
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(height: 320, autoPlay: true, viewportFraction: 1),
            ),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Theme.of(context).cardTheme.shadowColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          video != ''
                              ? GestureDetector(
                                  onTap: () {
                                    Get.to(() => VideoPlayerView(title: imageName.toUpperCase(), video: video));
                                  },
                                  child: playAnimation(),
                                )
                              : const SizedBox.shrink(),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: FavButton(
                              imageUrl: imageUrl,
                              ingredient: ingredient,
                              istruction: instruction,
                              name: imageName,
                              video: video,
                              imageList: imageList[0],
                              imageForFav: imageList,
                              backgroundIcon: AppColors().lilyColor1.withOpacity(.2),
                              heartColor: AppColors().lilyColor1,
                              height: 36,
                              width: 37,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardTheme.surfaceTintColor,
                          borderRadius: borderRadius30,
                        ),
                        child: TabBar(
                          labelColor: AppColors().whiteColor,
                          unselectedLabelColor: AppColors().lilyColor1,
                          indicator: BoxDecoration(
                            color: AppColors().lilyColor1,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelPadding: EdgeInsets.zero,
                          dividerColor: AppColors().transparentColor,
                          tabs: const [
                            Tab(
                              text: 'Ingredient',
                            ),
                            Tab(
                              text: 'Instruction',
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 110,
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            SingleChildScrollView(child: inreinetVSinstruction(context, ingredient, instruction, 'ingredient')),
                            SingleChildScrollView(child: inreinetVSinstruction(context, ingredient, instruction, 'instruction'))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding inreinetVSinstruction(context, ingredient, instructions, title) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: textForHomePage(
        context,
        title == 'instruction' ? instructions : ingredient,
        15,
        true,
        Theme.of(context).colorScheme.background,
        false,
        true,
      ),
    );
  }
}

Container buildImages(imageList) {
  return Container(
    width: double.maxFinite,
    height: 320,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage(imageList),
      ),
    ),
  );
}
