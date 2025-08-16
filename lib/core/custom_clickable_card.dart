import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/data/models/articles_response/article.dart';

import '../screens/home_screen/sources_view/widgets/article.dart';
import '../screens/home_screen/sources_view/widgets/view_article.dart';

class CustomClickableCard extends StatelessWidget {
  const CustomClickableCard({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: REdgeInsets.all(16),
              child: ViewFullArticle(article: article),
            );
          },
        );
      },
      child: ArticleItem(article: article),
    );
  }
}
