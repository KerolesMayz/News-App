import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/screens/home_screen/sources_view/widgets/view_article.dart';

import '../../../../data/models/articles_response/article.dart';
import 'article.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({
    super.key,
    required this.articles,
    // required this.articlesProvider,
    // required this.source,
  });

  // final Source source;
  final List<Article> articles;

  // final ArticlesViewModel articlesProvider;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  // int page = 1;
  // bool isLoading = false;
  // late ScrollController controller;
  // void listener() async {
  //   if (isLoading) return;
  //   if (controller.position.pixels >=
  //       controller.position.maxScrollExtent - 200 &&
  //       widget.articlesProvider.state is ArticlesSuccessState) {
  //     if (widget.articlesProvider.state is ArticlesSuccessState) {
  //       setState(() {
  //         isLoading = true;
  //       });
  //       page++;
  //       await widget.articlesProvider.loadArticles(widget.source,page: page);
  //       widget.articles.addAll((widget.articlesProvider.state as ArticlesSuccessState).article);
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   }
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   controller = ScrollController();
  //   controller.addListener(listener);
  // }

  @override
  Widget build(BuildContext context) {
    return widget.articles.isNotEmpty
        ? Expanded(
            child: ListView.separated(
              padding: REdgeInsets.all(16),
              itemBuilder: (context, index) {
                return index < widget.articles.length ? InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: REdgeInsets.all(16),
                          child: ViewFullArticle(
                            article: widget.articles[index],
                          ),
                        );
                      },
                    );
                  },
                  child: ArticleItem(article: widget.articles[index]),
                ) : Center(
                  child: CircularProgressIndicator(),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.h);
              },
              itemCount: widget.articles.length,
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
