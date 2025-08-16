import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/core/result.dart';

import '../models/articles_response/article.dart';
import '../models/articles_response/articles_response.dart';
import '../models/category_model/category_model.dart';
import '../models/sources_response/source.dart';
import '../models/sources_response/sources_response.dart';

class ApiServices {
  static const String _baseUrl = "newsapi.org";
  static const String _sourcesEndpoint = "/v2/top-headlines/sources";
  static const String _articlesEndpoint = "/v2/everything";
  static const String _apiKey = "0d0e20c2bfec494ab119a45127952aca";

  Future<Result<List<Source>>> getSources(CategoryModel category) async {
    Map<String, dynamic> queryParameters = {
      'apiKey': _apiKey,
      'category': category.id,
    };
    Uri url = Uri.https(_baseUrl, _sourcesEndpoint, queryParameters);

    try {
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == 'ok') {
        return Success(data: sourcesResponse.sources!);
      } else {
        return ServerError(
          code: sourcesResponse.code!,
          message: sourcesResponse.message!,
        );
      }
    } on Exception catch (e) {
      return GeneralException(exception: e);
    }
  }

  Future<Result<List<Article>>> getArticles(
    Source source, {
    int page = 1,
  }) async {
    Map<String, dynamic> queryParameters = {
      'apiKey': _apiKey,
      'sources': source.id,
      'pageSize': '10',
      'page': page.toString(),
    };
    Uri url = Uri.https(_baseUrl, _articlesEndpoint, queryParameters);
    try {
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == 'ok') {
        return Success(data: articlesResponse.articles!);
      } else {
        return ServerError(
          code: articlesResponse.code!,
          message: articlesResponse.message!,
        );
      }
    } on Exception catch (e) {
      return GeneralException(exception: e);
    }
  }

  Future<Result<List<Article>>> search(String q, int page) async {
    Map<String, dynamic> queryParameters = {
      'apiKey': _apiKey,
      'q': q,
      'pageSize': '10',
      'page': page.toString(),
    };
    Uri url = Uri.https(_baseUrl, _articlesEndpoint, queryParameters);
    try {
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == 'ok') {
        return Success(data: articlesResponse.articles!);
      } else {
        return ServerError(
          code: articlesResponse.code!,
          message: articlesResponse.message!,
        );
      }
    } on Exception catch (e) {
      return GeneralException(exception: e);
    }
  }
}
