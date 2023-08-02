import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';
import '../text_for_home_page.dart';

GestureDetector profileIconButton(
  BuildContext context,
  IconData icon,
  title,
  VoidCallback onTap,
  bool isNotImage,
) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        ListTile(
          leading: iconWithContainer(icon),
          title: Align(
            alignment: AlignmentDirectional.centerStart,
            child: textForHomePage(
              context,
              title,
              18,
              false,
              Theme.of(context).colorScheme.onSurface,
              true,
              true,
            ),
          ),
          trailing: Icon(
            IconlyBroken.arrowRightCircle,
            color: AppColors().lilyColor1,
          ),
        ),
        Divider(
          indent: 10,
          endIndent: 10,
          thickness: .6,
          color: Theme.of(context).colorScheme.onSecondary.withOpacity(.6),
        )
      ],
    ),
  );
}

Container iconWithContainer(IconData icon) {
  return Container(
    height: 35,
    width: 35,
    decoration: BoxDecoration(color: AppColors().lilyColor1.withOpacity(.2), borderRadius: borderRadius30),
    child: Icon(
      icon,
      size: 22,
      color: AppColors().lilyColor1,
    ),
  );
}
