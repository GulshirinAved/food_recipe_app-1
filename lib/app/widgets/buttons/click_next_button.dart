import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';

GestureDetector clickNextButton(VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(borderRadius: borderRadius30, color: AppColors().lilyColor1),
      child: Icon(
        IconlyLight.arrowRight,
        color: AppColors().whiteColor,
      ),
    ),
  );
}
