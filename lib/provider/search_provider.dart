import 'package:flutter/material.dart';
import 'package:news/repository_contract/search_repository.dart';

import '../core/result.dart';
import '../data/models/articles_response/article.dart';
import '../data/models/states_models/articles_state.dart';

class SearchProvider extends ChangeNotifier {
  ArticlesState state = ArticlesLoadingState();
  SearchRepository repository;
  List<Article> articles = [];

  SearchProvider({required this.repository});

  void emit(ArticlesState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> loadArticles(String query, {int page = 1}) async {
    if (state is! ArticlesLoadingState && page == 1) {
      emit(ArticlesLoadingState());
      notifyListeners();
    }
    if (query.trim() == '') {
      emit(ArticlesSuccessState(article: []));
    } else {
      Result<List<Article>> result = await repository.getSearchedArticles(
          query, page);
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
}
