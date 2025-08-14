import 'package:news/core/result.dart';
import 'package:news/data/data_source_contract/sources_data_source.dart';
import 'package:news/data/models/category_model/category_model.dart';
import 'package:news/data/models/sources_response/source.dart';
import 'package:news/repository_contract/sources_repository.dart';

class SourcesRepositoryImplementation implements SourcesRepository {
  SourcesDataSource dataSource;

  SourcesRepositoryImplementation({required this.dataSource});

  @override
  Future<Result<List<Source>>> getSources(CategoryModel category) async {
    var result = await dataSource.getSources(category);
    switch (result) {
      case Success<List<Source>>():
        return Success(data: result.data);
      case ServerError<List<Source>>():
        return ServerError(code: result.code, message: result.message);
      case GeneralException<List<Source>>():
        return GeneralException(exception: result.exception);
    }
  }
}
