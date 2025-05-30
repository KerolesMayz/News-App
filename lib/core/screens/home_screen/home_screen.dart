import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/assets_manager/assets_manager.dart';
import 'package:news/core/data/data_model/news_categories/news_categories.dart';
import 'package:news/core/screens/home_screen/widgets/card_widget/card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<NewsCategories> categoriesDark = [
    NewsCategories(
        id: 'general', name: 'general', imagePath: AssetsManager.generalDark),
    NewsCategories(
        id: 'business',
        name: 'business',
        imagePath: AssetsManager.businessDark),
    NewsCategories(
        id: 'sports', name: 'sports', imagePath: AssetsManager.sportsDark),
    NewsCategories(
        id: 'technology',
        name: 'technology',
        imagePath: AssetsManager.technologyDark)
  ];
  static const List<NewsCategories> categoriesLight = [
    NewsCategories(
        id: 'general', name: 'general', imagePath: AssetsManager.generalLight),
    NewsCategories(
        id: 'business',
        name: 'business',
        imagePath: AssetsManager.businessLight),
    NewsCategories(
        id: 'sports', name: 'sports', imagePath: AssetsManager.sportsLight),
    NewsCategories(
        id: 'technology',
        name: 'technology',
        imagePath: AssetsManager.technologyLight)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          )
        ],
      ),
      body: Padding(
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
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return CardWidget(
                        index: index, newsCategory: categoriesDark[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
