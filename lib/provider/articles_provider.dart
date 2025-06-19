import 'package:flutter/material.dart';

import '../api_services/api_services.dart';
import '../core/result.dart';
import '../models/articles_response/article.dart';
import '../models/sources_response/source.dart';

class ArticlesProvider extends ChangeNotifier {
  ArticlesState state = ArticlesLoadingState();

  void emit(ArticlesState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> loadArticles(Source source) async {
    if (state != ArticlesLoadingState()) {
      state = ArticlesLoadingState();
      notifyListeners();
    }
    if (source.id == null) {
      emit(ArticlesErrorState());
      return;
    }
    Result<List<Article>> result = await ApiServices.getArticles(source);
    switch (result) {
      case Success<List<Article>>():
        emit(ArticlesSuccessState(article: result.data));
      case ServerError<List<Article>>():
        emit(ArticlesErrorState(serverError: result));
      case GeneralException<List<Article>>():
        emit(ArticlesErrorState(exception: result));
    }
  }
}

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
  GeneralException? exception;

  ArticlesErrorState({this.serverError, this.exception});
}
