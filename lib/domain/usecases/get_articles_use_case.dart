import 'package:news/core/result.dart';
import 'package:news/domain/entities/article_entity.dart';
import 'package:news/domain/entities/source_entity.dart';
import 'package:news/domain/repository_contract/articles_repository.dart';

class GetArticlesUseCase {
  ArticlesRepository repository;

  GetArticlesUseCase({required this.repository});

  Future<Result<List<ArticleEntity>>> invoke(SourceEntity source, int page) {
    return repository.getArticles(source, page);
  }
}
