import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';

Container addToIngredintContaier(IconData icon) {
  return Container(
    height: 18,
    width: 18,
    decoration: BoxDecoration(
      color: AppColors().whiteColor,
      borderRadius: borderRadius10,
      border: Border.all(color: AppColors().lilyColor1),
      boxShadow: [BoxShadow(color: AppColors().lilyColor1, blurRadius: 2)],
    ),
    child: Icon(
      icon,
      size: 15,
    ),
  );
}
