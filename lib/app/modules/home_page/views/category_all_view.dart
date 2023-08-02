import 'package:flutter/material.dart';

import '../../../widgets/app_bar/app_bar_for_pages.dart';
import '../../../widgets/card/card_for_category_all_view.dart';

class CategoryAllView extends StatelessWidget {
  const CategoryAllView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarForPages(context, 'Categories'),
      body: cardForCategoryAllView(),
    );
  }
}
