import 'package:flutter/material.dart';
import 'package:news/api_services/api_services.dart';
import 'package:news/core/result.dart';
import 'package:news/models/category_model.dart';

import '../models/sources_response/source.dart';

class SourcesViewProvider extends ChangeNotifier {
  SourcesState state = SourcesLoadingState();
  Source firstSource = Source();

  void emit(SourcesState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> loadSources(CategoryModel category) async {
    state = SourcesLoadingState();
    notifyListeners();
    Result<List<Source>> result = await ApiServices.getSources(category);
    switch (result) {
      case Success<List<Source>>():
        firstSource = result.data[0];
        emit(SourcesSuccessState(sources: result.data));
      case ServerError<List<Source>>():
        emit(SourcesErrorState(serverError: result));
      case GeneralException<List<Source>>():
        emit(SourcesErrorState(exception: result));
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
  GeneralException? exception;

  SourcesErrorState({this.serverError, this.exception});
}
