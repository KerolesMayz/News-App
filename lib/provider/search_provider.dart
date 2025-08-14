import 'package:flutter/material.dart';
import 'package:news/repository_contract/search_repository.dart';

import '../core/result.dart';
import '../data/models/articles_response/article.dart';
import 'articles_view_model.dart';

class SearchProvider extends ChangeNotifier {
  ArticlesState state = ArticlesLoadingState();
  SearchRepository repository;

  SearchProvider({required this.repository});

  void emit(ArticlesState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> loadArticles(String query) async {
    if (state != ArticlesLoadingState()) {
      state = ArticlesLoadingState();
      notifyListeners();
    }
    if (query.trim() == '') {
      emit(ArticlesSuccessState(article: []));
    } else {
      Result<List<Article>> result = await repository.getSearchedArticles(
          query);
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
}
