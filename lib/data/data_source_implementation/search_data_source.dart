import 'package:news/core/result.dart';
import 'package:news/data/api_services/api_services.dart';
import 'package:news/data/data_source_contract/search_data_source.dart';
import 'package:news/data/models/articles_response/article.dart';

class SearchApiDataSourceImplementation implements SearchDataSource {
  ApiServices apiServices;

  SearchApiDataSourceImplementation({required this.apiServices});

  @override
  Future<Result<List<Article>>> getSearchedArticles(String q, int page) {
    return apiServices.search(q, page);
  }
}
