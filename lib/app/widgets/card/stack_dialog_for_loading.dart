import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';
import '../text_for_home_page.dart';

Container stackDialogLoading(context) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors().whiteColor,
      borderRadius: borderRadius15,
    ),
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(
          color: AppColors().lilyColor1,
        ),
        textForHomePage(context, 'Please wait...', 20, true, AppColors().lilyColor1, false, true)
      ],
    ),
  );
}
