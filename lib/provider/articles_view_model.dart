import 'dart:io';
import 'package:flutter/material.dart';
import '../core/result.dart';
import '../data/api_services/api_services.dart';
import '../data/models/articles_response/article.dart';
import '../data/models/sources_response/source.dart';

class ArticlesViewModel extends ChangeNotifier {
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
      emit(ArticlesErrorState(exception: const HttpException('bad request')));
      return;
    }
    Result<List<Article>> result = await ApiServices.getArticles(source);
    switch (result) {
      case Success<List<Article>>():
        emit(ArticlesSuccessState(article: result.data));
      case ServerError<List<Article>>():
        emit(ArticlesErrorState(serverError: result));
      case GeneralException<List<Article>>():
        emit(ArticlesErrorState(exception: result.exception));
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
  Exception? exception;

  ArticlesErrorState({this.serverError, this.exception});
}
