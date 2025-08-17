import 'package:news/core/result.dart';
import 'package:news/data/models/category_model/category_model.dart';
import 'package:news/domain/entities/source_entity.dart';
import 'package:news/domain/repository_contract/sources_repository.dart';

class GetSourcesUseCase {
  SourcesRepository repository;

  GetSourcesUseCase({required this.repository});

  Future<Result<List<SourceEntity>>> invoke(CategoryModel category) {
    return repository.getSources(category);
  }
}
