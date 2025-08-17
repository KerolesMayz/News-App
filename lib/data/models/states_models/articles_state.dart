import 'package:news/domain/entities/article_entity.dart';

import '../../../core/result.dart';

sealed class ArticlesState {}

class ArticlesSuccessState extends ArticlesState {
  List<ArticleEntity> article;

  ArticlesSuccessState({required this.article});
}

class ArticlesLoadingState extends ArticlesState {
  String? loadingMsg;

  ArticlesLoadingState({this.loadingMsg});
}

class ArticlesErrorState extends ArticlesState {
  ServerError? serverError;
  Exception? exception;

  ArticlesErrorState({this.serverError, this.exception});
}
