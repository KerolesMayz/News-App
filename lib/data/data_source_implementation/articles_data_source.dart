import 'package:news/core/result.dart';
import 'package:news/data/api_services/api_services.dart';
import 'package:news/data/data_source_contract/articles_data_source.dart';
import 'package:news/data/models/articles_response/article.dart';
import 'package:news/data/models/sources_response/source.dart';

class ArticlesApiDataSourceImplementation implements ArticlesDataSource {
  ApiServices apiServices;

  ArticlesApiDataSourceImplementation({required this.apiServices});

  @override
  Future<Result<List<Article>>> getArticles(Source source, int page) {
    return apiServices.getArticles(source, page: page);
  }
}
