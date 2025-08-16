import '../../../core/result.dart';
import '../sources_response/source.dart';

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
