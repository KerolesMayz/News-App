import 'package:news/core/result.dart';
import 'package:news/data/data_source_contract/articles_data_source.dart';
import 'package:news/data/models/articles_response/article.dart';
import 'package:news/data/models/sources_response/source.dart';
import 'package:news/repository_contract/articles_repository.dart';

class ArticlesRepositoryImplementation implements ArticlesRepository {
  ArticlesDataSource dataSource;

  ArticlesRepositoryImplementation({required this.dataSource});

  @override
  Future<Result<List<Article>>> getArticles(Source source, int page) async {
    var result = await dataSource.getArticles(source, page);
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
