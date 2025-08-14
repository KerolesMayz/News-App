import 'package:flutter/material.dart';
import 'package:news/core/result.dart';
import 'package:news/repository_contract/sources_repository.dart';

import '../data/models/category_model/category_model.dart';
import '../data/models/sources_response/source.dart';

class SourcesViewModel extends ChangeNotifier {
  SourcesState state = SourcesLoadingState();
  SourcesRepository repository;

  SourcesViewModel({required this.repository});

  void emit(SourcesState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> loadSources(CategoryModel category) async {
    state = SourcesLoadingState();
    notifyListeners();
    Result<List<Source>> result = await repository.getSources(category);
    switch (result) {
      case Success<List<Source>>():
        emit(SourcesSuccessState(sources: result.data));
      case ServerError<List<Source>>():
        emit(SourcesErrorState(serverError: result));
      case GeneralException<List<Source>>():
        emit(SourcesErrorState(exception: result.exception));
    }
  }
}

sealed class SourcesState {}

class SourcesSuccessState extends SourcesState {
  List<Source> sources;

  SourcesSuccessState({required this.sources});
}

class SourcesLoadingState extends SourcesState {
  String? loadingMsg;

  SourcesLoadingState({this.loadingMsg});
}

class SourcesErrorState extends SourcesState {
  ServerError? serverError;
  Exception? exception;

  SourcesErrorState({this.serverError, this.exception});
}
