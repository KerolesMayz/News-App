import 'article.dart';

class ArticlesResponse {
  ArticlesResponse({
    this.code,
    this.message,
    this.status,
    this.totalResults,
    this.articles,
  });

  ArticlesResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }

  String? status;
  String? code;
  String? message;
  num? totalResults;
  List<Article>? articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    map['message'] = message;
    map['code'] = code;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
