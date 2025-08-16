import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news/repository_contract/articles_repository.dart';

import '../core/result.dart';
import '../data/models/articles_response/article.dart';
import '../data/models/sources_response/source.dart';
import '../data/models/states_models/articles_state.dart';

class ArticlesViewModel extends ChangeNotifier {
  ArticlesState state = ArticlesLoadingState();
  ArticlesRepository repository;
  List<Article> articles = [];

  ArticlesViewModel({required this.repository});

  void emit(ArticlesState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> loadArticles(Source source, {int page = 1}) async {
    if (state is! ArticlesLoadingState && page == 1) {
      emit(ArticlesLoadingState());
      notifyListeners();
    }
    if (source.id == null) {
      emit(ArticlesErrorState(exception: const HttpException('bad request')));
      return;
    }
    Result<List<Article>> result = await repository.getArticles(source, page);
    switch (result) {
      case Success<List<Article>>():
        if (page == 1) {
          articles = result.data;
        } else {
          articles.addAll(result.data);
        }
        emit(ArticlesSuccessState(article: result.data));
      case ServerError<List<Article>>():
        emit(ArticlesErrorState(serverError: result));
      case GeneralException<List<Article>>():
        emit(ArticlesErrorState(exception: result.exception));
    }
  }
}