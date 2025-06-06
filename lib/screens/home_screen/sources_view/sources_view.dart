import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/article_model.dart';
import '../../../../models/source_model.dart';
import '../../../models/category_model.dart';
import 'widgets/article.dart';

class SourcesView extends StatelessWidget {
  const SourcesView({super.key, required this.category});

  final CategoryModel category;

  static final List<SourceModel> sources = [
    SourceModel(id: '1', name: 'ABC News'),
    SourceModel(id: '2', name: 'Arabia'),
    SourceModel(id: '3', name: 'BBC News'),
    SourceModel(id: '1', name: 'ABC News'),
    SourceModel(id: '2', name: 'Arabia'),
    SourceModel(id: '3', name: 'BBC News'),
    SourceModel(id: '1', name: 'ABC News'),
    SourceModel(id: '2', name: 'Arabia'),
    SourceModel(id: '3', name: 'BBC News'),
    SourceModel(id: '3', name: 'BBC News'),
  ];
  static final List<ArticleModel> articles = [
    const ArticleModel(
        author: 'Jon Haworth',
        title:
            '40-year-old man falls 200 feet to his death while canyoneering at national park',
        publishedAt: '15 minutes ago',
        imagePath: 'assets/images/Rectangle2.png'),
    const ArticleModel(
        author: 'Jon Haworth',
        title:
            '40-year-old man falls 200 feet to his death while canyoneering at national park',
        publishedAt: '15 minutes ago',
        imagePath: 'assets/images/Rectangle2.png'),
    const ArticleModel(
        author: 'Jon Haworth',
        title:
            '40-year-old man falls 200 feet to his death while canyoneering at national park',
        publishedAt: '15 minutes ago',
        imagePath: 'assets/images/Rectangle2.png'),
    const ArticleModel(
        author: 'Jon Haworth',
        title:
            '40-year-old man falls 200 feet to his death while canyoneering at national park',
        publishedAt: '15 minutes ago',
        imagePath: 'assets/images/Rectangle2.png'),
    const ArticleModel(
        author: 'Jon Haworth',
        title:
            '40-year-old man falls 200 feet to his death while canyoneering at national park',
        publishedAt: '15 minutes ago',
        imagePath: 'assets/images/Rectangle2.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DefaultTabController(
          length: 10,
          child: TabBar(
              isScrollable: true,
              tabs: sources
                  .map((source) => Tab(
                        text: source.name,
                      ))
                  .toList()),
        ),
        Expanded(
            child: ListView.separated(
                padding: REdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return ArticleItem(
                    article: articles[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 16.h,
                  );
                },
                itemCount: articles.length))
      ],
    );
  }
}
