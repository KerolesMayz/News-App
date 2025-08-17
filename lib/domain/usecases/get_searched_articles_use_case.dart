import 'package:news/core/result.dart';
import 'package:news/domain/entities/article_entity.dart';
import 'package:news/domain/repository_contract/search_repository.dart';

class GetSearchedArticlesUseCase {
  SearchRepository repository;

  GetSearchedArticlesUseCase({required this.repository});

  Future<Result<List<ArticleEntity>>> invoke(String q, int page) {
    return repository.getSearchedArticles(q, page);
  }
}
