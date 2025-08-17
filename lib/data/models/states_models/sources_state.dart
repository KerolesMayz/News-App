import 'package:news/domain/entities/source_entity.dart';

import '../../../core/result.dart';

sealed class SourcesState {}

class SourcesSuccessState extends SourcesState {
  List<SourceEntity> sources;

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
