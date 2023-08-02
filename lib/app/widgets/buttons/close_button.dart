import 'package:flutter/material.dart';

import '../../core/colors.dart';

Container buttonClose(VoidCallback onTap) {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
      ),
      color: AppColors().whiteColor,
    ),
    child: IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.close,
        color: AppColors().blackColor,
      ),
    ),
  );
}
