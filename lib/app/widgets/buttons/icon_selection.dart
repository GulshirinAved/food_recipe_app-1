import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';

Container selectIcon(String imageLan) {
  return Container(
    height: 44,
    width: 44,
    decoration: BoxDecoration(
      borderRadius: borderRadius30,
      image: DecorationImage(
        image: AssetImage(
          imageLan,
        ),
        fit: BoxFit.fill,
      ),
      color: AppColors().blackColor,
    ),
  );
}
