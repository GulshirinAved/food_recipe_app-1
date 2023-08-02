import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';

Padding textField(TextEditingController controller, String textType, String hintText, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextField(
      controller: controller,
      keyboardType: textType == 'multiLine'
          ? TextInputType.multiline
          : textType == 'text'
              ? TextInputType.name
              : textType == 'list'
                  ? TextInputType.multiline
                  : TextInputType.name,
      maxLines: textType == 'multiLine' || textType == 'list' ? null : 1,
      textInputAction: textType == 'multiLine' || textType == 'list' ? TextInputAction.newline : TextInputAction.done,
      autofocus: true,
      autocorrect: false,
      style: TextStyle(color: Theme.of(context).colorScheme.background, fontFamily: fontGilroy, fontWeight: FontWeight.bold),
      cursorColor: AppColors().lilyColor1,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors().lilyColor1.withOpacity(.1),
        alignLabelWithHint: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.background.withOpacity(.4),
          fontFamily: fontGilroy,
        ),
        prefixIcon: textType == 'text'
            ? Icon(
                Icons.dinner_dining,
                color: AppColors().lilyColor1,
              )
            : textType == 'list'
                ? Icon(
                    IconlyLight.buy,
                    color: AppColors().lilyColor1,
                  )
                : Icon(
                    IconlyLight.document,
                    color: AppColors().lilyColor1,
                  ),
        suffixIcon: controller.text.isEmpty
            ? Container(
                width: 0,
              )
            : IconButton(
                onPressed: () {
                  controller.clear();
                },
                icon: Icon(
                  Icons.close,
                  color: AppColors().blackColor.withOpacity(.6),
                ),
              ),
        border: OutlineInputBorder(
          borderRadius: borderRadius15,
          borderSide: BorderSide(
            color: AppColors().lilyColor1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius15,
          borderSide: BorderSide(
            color: AppColors().lilyColor1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius15,
          borderSide: BorderSide(
            color: AppColors().lilyColor1,
          ),
        ),
      ),
      onEditingComplete: () {
        controller.clear();
      },
    ),
  );
}
