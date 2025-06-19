import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../models/category_model.dart';
import 'widgets/card_widget/category_item.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    List<CategoryModel> categories = homeProvider.currentTheme == ThemeMode.dark
        ? CategoryModel.categoriesDark
        : CategoryModel.categoriesLight;
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 16.h,
                  );
                },
                padding: REdgeInsets.symmetric(vertical: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryItem(
                      index: index, newsCategory: categories[index]);
                }),
          )
        ],
      ),
    );
  }
}
