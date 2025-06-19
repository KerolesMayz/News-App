import '../core/assets_manager/assets_manager.dart';

class CategoryModel {
  final String title;
  final String id;
  final String imagePath;

  const CategoryModel(
      {required this.title, required this.id, required this.imagePath});

  static List<CategoryModel> categoriesDark = const [
    CategoryModel(
        id: 'general', title: 'General', imagePath: AssetsManager.generalDark),
    CategoryModel(
        id: 'business',
        title: 'Business',
        imagePath: AssetsManager.businessDark),
    CategoryModel(
        id: 'sports', title: 'Sports', imagePath: AssetsManager.sportsDark),
    CategoryModel(
        id: 'technology',
        title: 'Technology',
        imagePath: AssetsManager.technologyDark),
    CategoryModel(
        id: 'entertainment',
        title: 'Entertainment',
        imagePath: AssetsManager.entertainmentDark),
    CategoryModel(
        id: 'health', title: 'Health', imagePath: AssetsManager.healthDark),
    CategoryModel(
        id: 'science', title: 'Science', imagePath: AssetsManager.scienceDark)
  ];
  static List<CategoryModel> categoriesLight = const [
    CategoryModel(
        id: 'general', title: 'General', imagePath: AssetsManager.generalLight),
    CategoryModel(
        id: 'business',
        title: 'Business',
        imagePath: AssetsManager.businessLight),
    CategoryModel(
        id: 'sports', title: 'Sports', imagePath: AssetsManager.sportsLight),
    CategoryModel(
        id: 'technology',
        title: 'Technology',
        imagePath: AssetsManager.technologyLight),
    CategoryModel(
        id: 'entertainment',
        title: 'Entertainment',
        imagePath: AssetsManager.entertainmentLight),
    CategoryModel(
        id: 'health', title: 'Health', imagePath: AssetsManager.healthLight),
    CategoryModel(
        id: 'science', title: 'Science', imagePath: AssetsManager.scienceLight)
  ];
}
