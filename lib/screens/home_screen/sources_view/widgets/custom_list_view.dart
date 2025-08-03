import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/screens/home_screen/sources_view/widgets/view_article.dart';

import '../../../../data/models/articles_response/article.dart';
import 'article.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.articles});

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return articles.isNotEmpty
        ? Expanded(
            child: ListView.separated(
              padding: REdgeInsets.all(16),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: REdgeInsets.all(16),
                          child: ViewFullArticle(article: articles[index]),
                        );
                      },
                    );
                  },
                  child: ArticleItem(article: articles[index]),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.h);
              },
              itemCount: articles.length,
            ),
          )
        : Expanded(
            child: Center(
              child: Text(
                'No Articles Found',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          );
  }
}
