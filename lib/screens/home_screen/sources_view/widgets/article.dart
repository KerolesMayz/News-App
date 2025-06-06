import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/models/article_model.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.only(bottom: 8),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child:
                      Image.asset(article.imagePath, width: double.infinity)),
            ),
            Text(
              article.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'By: ${article.author}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(article.publishedAt,
                    style: Theme.of(context).textTheme.titleSmall)
              ],
            )
          ],
        ),
      ),
    );
  }
}
