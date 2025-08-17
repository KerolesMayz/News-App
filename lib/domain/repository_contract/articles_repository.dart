import 'package:news/domain/entities/article_entity.dart';
import 'package:news/domain/entities/source_entity.dart';

import '../../core/result.dart';


abstract class ArticlesRepository {
  Future<Result<List<ArticleEntity>>> getArticles(SourceEntity source,
      int page);
}
