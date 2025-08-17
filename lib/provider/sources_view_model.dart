import 'package:flutter/material.dart';
import 'package:news/core/result.dart';
import 'package:news/domain/entities/source_entity.dart';
import 'package:news/domain/usecases/get_sources_use_case.dart';

import '../data/models/category_model/category_model.dart';
import '../data/models/states_models/sources_state.dart';

class SourcesViewModel extends ChangeNotifier {
  SourcesState state = SourcesLoadingState();
  GetSourcesUseCase repository;

  SourcesViewModel({required this.repository});

  void emit(SourcesState newState) {
    state = newState;
    notifyListeners();
  }

  Future<void> loadSources(CategoryModel category) async {
    state = SourcesLoadingState();
    notifyListeners();
    Result<List<SourceEntity>> result = await repository.invoke(category);
    switch (result) {
      case Success<List<SourceEntity>>():
        emit(SourcesSuccessState(sources: result.data));
      case ServerError<List<SourceEntity>>():
        emit(SourcesErrorState(serverError: result));
      case GeneralException<List<SourceEntity>>():
        emit(SourcesErrorState(exception: result.exception));
    }
  }
}

