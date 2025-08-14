import 'package:news/data/models/category_model/category_model.dart';
import 'package:news/data/models/sources_response/source.dart';

import '../core/result.dart';

abstract class SourcesRepository {
  Future<Result<List<Source>>> getSources(CategoryModel category);
}
