import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/screens/home_screen/categories_view/widgets/card_widget/view_all_button.dart';

import '../../../../../../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.newsCategory, required this.index});

  final CategoryModel newsCategory;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Image.asset(
            newsCategory.imagePath,
            width: double.infinity,
          ),
        ),
        Padding(
          padding: REdgeInsets.all(16),
          child: ViewAllButton(index: index, category: newsCategory),
        )
      ],
    );
  }
}
