import 'package:news/data/models/articles_response/article.dart';

import '../core/result.dart';

abstract class SearchRepository {
  Future<Result<List<Article>>> getSearchedArticles(String q);
}
