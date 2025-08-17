import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news/domain/entities/article_entity.dart';
import 'package:news/domain/entities/source_entity.dart';
import 'package:news/domain/usecases/get_articles_use_case.dart';

import '../core/result.dart';
import '../data/models/states_models/articles_state.dart';

class ArticlesViewModel extends ChangeNotifier {
  ArticlesState state = ArticlesLoadingState();
  GetArticlesUseCase articlesUseCase;
  List<ArticleEntity> articles = [];

  ArticlesViewModel({required this.articlesUseCase});

  void emit(ArticlesState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> loadArticles(SourceEntity source, {int page = 1}) async {
    if (state is! ArticlesLoadingState && page == 1) {
      emit(ArticlesLoadingState());
      notifyListeners();
    }
    if (source.id == null) {
      emit(ArticlesErrorState(exception: const HttpException('bad request')));
      return;
    }
    Result<List<ArticleEntity>> result = await articlesUseCase.invoke(
        source, page);
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