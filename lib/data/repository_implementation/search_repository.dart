import 'package:news/core/result.dart';
import 'package:news/data/data_source_contract/search_data_source.dart';
import 'package:news/data/models/articles_response/article.dart';
import 'package:news/repository_contract/search_repository.dart';

class SearchRepositoryImplementation implements SearchRepository {
  SearchDataSource dataSource;

  SearchRepositoryImplementation({required this.dataSource});

  @override
  Future<Result<List<Article>>> getSearchedArticles(String q) async {
    var result = await dataSource.getSearchedArticles(q);
    switch (result) {
      case Success<List<Article>>():
        return Success(data: result.data);
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case GeneralException<List<Article>>():
        return GeneralException(exception: result.exception);
    }
  }
}
