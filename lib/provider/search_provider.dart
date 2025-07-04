import 'package:flutter/material.dart';

import '../api_services/api_services.dart';
import '../core/result.dart';
import '../models/articles_response/article.dart';
import 'articles_provider.dart';

class SearchProvider extends ChangeNotifier {
  ArticlesState state = ArticlesLoadingState();

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
      Result<List<Article>> result = await ApiServices.search(query);
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
