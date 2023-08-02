import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../text_for_home_page.dart';

Row buttonForEditing(BuildContext context, String title, IconData icon) {
  return Row(
    children: [
      Icon(
        icon,
        color: AppColors().whiteColor,
      ),
      const SizedBox(
        width: 20,
      ),
      textForHomePage(
        context,
        title,
        20,
        false,
        AppColors().whiteColor,
        true,
        true,
      )
    ],
  );
}
