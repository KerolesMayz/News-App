import 'package:news/data/models/category_model.dart';
import 'package:news/data/models/sources_response/source.dart';

import '../../core/result.dart';

abstract class SourcesDataSource {
  Future<Result<List<Source>>> getSources(CategoryModel category);
}
