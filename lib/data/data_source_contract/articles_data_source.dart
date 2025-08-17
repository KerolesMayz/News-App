import 'package:news/data/models/articles_response/article.dart';
import 'package:news/domain/entities/source_entity.dart';

import '../../core/result.dart';

abstract class ArticlesDataSource {
  Future<Result<List<Article>>> getArticles(SourceEntity source, int page);
}
