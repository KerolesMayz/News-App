import 'package:news/domain/entities/article_entity.dart';

import '../../core/result.dart';

abstract class SearchRepository {
  Future<Result<List<ArticleEntity>>> getSearchedArticles(String q, int page);
}
