import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/app/core/colors.dart';
import 'package:food_recipe_app/app/core/constants.dart';
import 'package:food_recipe_app/app/data/model/services/crud_services.dart';
import 'package:food_recipe_app/app/modules/home_page/controllers/home_controller.dart';
import 'package:food_recipe_app/app/widgets/app_bar/app_bar_for_category.dart';
import 'package:food_recipe_app/app/widgets/buttons/favButton.dart';
import 'package:food_recipe_app/app/widgets/text_for_home_page.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/buttons/close_button.dart';
import '../../../widgets/card/card_for_image_adding.dart';
import '../../../widgets/card/stack_dialog_for_loading.dart';
import '../../../widgets/picked_image.dart';
import '../../../widgets/text_field/text_field.dart';
import '../controllers/my_own_recipe_controller.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({
    super.key,
  });

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController howTocookController = TextEditingController();

  TextEditingController listController = TextEditingController();

  MyOwnRecipeController myOwnRecipeController = Get.put(MyOwnRecipeController());
  HomeController homeController = Get.put(HomeController());
  CrudMethods crusMethods = CrudMethods();

  int quantity = 1;

  File? _image;
  final picker = ImagePicker();
  bool uploading = false;
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selecyed');
      }
    });
  }

  Future<String> uploadFile() async {
    File file = File(_image!.path);
    DateTime now = DateTime.now();
    String imagename = 'productImage/${now.second}';
    String? downloadUrl;

    try {
      await FirebaseStorage.instance.ref(imagename).putFile(file);
      downloadUrl = await FirebaseStorage.instance.ref(imagename).getDownloadURL();
      setState(() {
        _image = null;
      });
      print(downloadUrl);
      setState(() {
        _image = null;
        myOwnRecipeController.addImageMyOwnRecipe(
          imageUrl: downloadUrl!,
          foodName: nameController.text,
          howToCook: howTocookController.text,
          listOfProducts: listController.text,
        );

        crusMethods.setREcipe(downloadUrl, nameController.text, howTocookController.text, listController.text, false).then((value) {
          Get.back();
          nameController.clear();
        });
      });
    } on FirebaseException {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('cancled')));
    }
    return downloadUrl!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarForCategoryPage(
        context,
        false,
        'Add my recipes',
        () {
          like('Wait please..');

          setState(() {
            uploading = true;
            uploadFile().then((url) {
              setState(() {
                uploading = false;
              });
              homeController.products.clear();
              Get.back();
            });
          });

          _showDialog(context, 'lalala');
          Get.back();
        },
        Icons.done_outline_rounded,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: textForHomePage(
              context,
              'Meal Name',
              15,
              true,
              Theme.of(context).colorScheme.background,
              true,
              false,
            ),
          ),
          textField(nameController, 'text', 'Write the meal\'s name', context),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: textForHomePage(
              context,
              'Instruction',
              15,
              true,
              Theme.of(context).colorScheme.background,
              true,
              false,
            ),
          ),
          textField(howTocookController, 'multiLine', 'Write instruction', context),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: textForHomePage(
              context,
              'Needed products',
              15,
              true,
              Theme.of(context).colorScheme.background,
              true,
              false,
            ),
          ),
          textField(listController, 'multiLine', 'Write ingredient', context),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: textForHomePage(
              context,
              'Add photo',
              15,
              true,
              Theme.of(context).colorScheme.background,
              true,
              false,
            ),
          ),
          cardForAddImage(
            getImage,
            Icons.add_a_photo,
          ),
          Center(
            child: _image == null
                ? const SizedBox.shrink()
                : Stack(
                    children: [
                      pickedImage(_image!),
                      Positioned(
                        top: 25,
                        right: 0,
                        child: buttonClose(() {
                          setState(() {
                            _image = null;
                          });
                        }),
                      )
                    ],
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

void _showDialog(context, title) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return SizedBox(
        height: 100,
        child: Dialog(
          backgroundColor: AppColors().whiteColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius15),
          child: stackDialogLoading(
            context,
          ),
        ),
      );
    },
  );
}
