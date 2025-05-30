import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/data/data_model/news_categories/news_categories.dart';
import 'package:news/core/screens/home_screen/widgets/card_widget/view_all_button.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key, required this.newsCategory, required this.index});

  final NewsCategories newsCategory;
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
        ViewAllButton(index: index)
      ],
    );
  }
}
