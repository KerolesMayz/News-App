import 'package:news/data/models/articles_response/article.dart';

import '../../core/result.dart';

abstract class SearchDataSource {
  Future<Result<List<Article>>> getSearchedArticles(String q);
}
