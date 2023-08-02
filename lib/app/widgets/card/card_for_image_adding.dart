import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';

GestureDetector cardForAddImage(VoidCallback onTap, IconData icon) {
  return GestureDetector(
    onTap: onTap,
    child: Center(
      child: Container(
        height: 70,
        width: 250,
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(color: AppColors().greyColor, borderRadius: borderRadius20),
        child: Icon(
          icon,
          color: AppColors().lilyColor1,
        ),
      ),
    ),
  );
}
