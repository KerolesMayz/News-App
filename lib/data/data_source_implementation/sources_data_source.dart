import 'package:news/core/result.dart';
import 'package:news/data/api_services/api_services.dart';
import 'package:news/data/data_source_contract/sources_data_source.dart';
import 'package:news/data/models/category_model.dart';
import 'package:news/data/models/sources_response/source.dart';

class SourcesApiDataSourceImplementation implements SourcesDataSource {
  ApiServices apiServices;

  SourcesApiDataSourceImplementation({required this.apiServices});

  @override
  Future<Result<List<Source>>> getSources(CategoryModel category) {
    return apiServices.getSources(category);
  }
}
