import '../../../core/result.dart';
import '../articles_response/article.dart';

sealed class ArticlesState {}

class ArticlesSuccessState extends ArticlesState {
  List<Article> article;

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
