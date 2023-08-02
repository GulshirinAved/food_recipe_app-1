import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:food_recipe_app/app/modules/fav_page/controllers/fav_page_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';

class FavButton extends StatefulWidget {
  final String imageUrl;
  final String ingredient;
  final String istruction;
  final String name;
  final String video;
  final String imageList;
  final List imageForFav;

  const FavButton({super.key, required this.imageUrl, required this.ingredient, required this.istruction, required this.name, required this.video, required this.imageList, required this.imageForFav});

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  FavPageController favController = Get.put(FavPageController());

  GetStorage storage = GetStorage();

  bool value = false;

  @override
  void initState() {
    // TODO: implement initState
    work();
    super.initState();
  }

  dynamic work() {
    for (var element in favController.products) {
      if (element['image'] == widget.imageUrl) {
        value = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    work();
    return GestureDetector(
      onTap: () {
        value = !value;
        if (value) {
          favController.addFav(
            widget.imageUrl,
            widget.ingredient,
            widget.istruction,
            widget.name,
            widget.video,
            widget.imageForFav,
          );
          like('Added to favorites');
          if (!mounted) {
            return;
          }
        } else {
          favController.removeFavItem(widget.imageUrl);
          like('Removed fromfavorites');
          if (!mounted) {
            return;
          }
        }
        setState(() {});
      },
      child: Container(
        height: 36,
        width: 37,
        decoration: BoxDecoration(color: AppColors().lilyColor1.withOpacity(.2), borderRadius: borderRadius30),
        child: Icon(
          value ? IconlyBold.heart : IconlyLight.heart,
          size: 22,
          color: AppColors().lilyColor1,
        ),
      ),
    );
  }
}

dynamic like(String title) {
  Get.rawSnackbar(
    margin: const EdgeInsets.all(8),
    borderRadius: 15,
    backgroundColor: Colors.white70,
    messageText: Center(
      child: Text(
        title,
        style: TextStyle(color: AppColors().blackColor, fontSize: 20, fontFamily: fontGilroy),
      ),
    ),
    snackPosition: SnackPosition.TOP,
  );
}
