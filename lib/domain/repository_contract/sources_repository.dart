import 'package:news/data/models/category_model/category_model.dart';
import 'package:news/domain/entities/source_entity.dart';

import '../../core/result.dart';

abstract class SourcesRepository {
  Future<Result<List<SourceEntity>>> getSources(CategoryModel category);
}
