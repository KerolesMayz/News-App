import 'package:news/data/models/articles_response/article.dart';
import 'package:news/data/models/sources_response/source.dart';

import '../core/result.dart';

abstract class ArticlesRepository {
  Future<Result<List<Article>>> getArticles(Source source, int page);
}
