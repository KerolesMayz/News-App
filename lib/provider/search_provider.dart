import 'package:flutter/material.dart';
import 'package:news/domain/entities/article_entity.dart';
import 'package:news/domain/usecases/get_searched_articles_use_case.dart';

import '../core/result.dart';
import '../data/models/states_models/articles_state.dart';

class SearchProvider extends ChangeNotifier {
  ArticlesState state = ArticlesLoadingState();
  GetSearchedArticlesUseCase repository;
  List<ArticleEntity> articles = [];

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
      Result<List<ArticleEntity>> result = await repository.invoke(query, page);
      switch (result) {
        case Success<List<ArticleEntity>>():
          if (page == 1) {
            articles = result.data;
          } else {
            articles.addAll(result.data);
          }
          emit(ArticlesSuccessState(article: result.data));
        case ServerError<List<ArticleEntity>>():
          emit(ArticlesErrorState(serverError: result));
        case GeneralException<List<ArticleEntity>>():
          emit(ArticlesErrorState(exception: result.exception));
      }
    }
  }
}
