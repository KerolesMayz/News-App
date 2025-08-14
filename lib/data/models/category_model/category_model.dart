import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/assets_manager/assets_manager.dart';
import '../../../l10n/app_localizations.dart';
import '../../../provider/home_provider.dart';

class CategoryModel {
  final String title;
  final String id;
  final String imagePath;

  const CategoryModel({
    required this.title,
    required this.id,
    required this.imagePath,
  });

  static List<CategoryModel> getCategoriesList(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    List<CategoryModel> categoriesDark = [
      CategoryModel(
        id: 'general',
        title: AppLocalizations.of(context)!.general,
        imagePath: AssetsManager.generalDark,
      ),
      CategoryModel(
        id: 'business',
        title: AppLocalizations.of(context)!.business,
        imagePath: AssetsManager.businessDark,
      ),
      CategoryModel(
        id: 'sports',
        title: AppLocalizations.of(context)!.sports,
        imagePath: AssetsManager.sportsDark,
      ),
      CategoryModel(
        id: 'technology',
        title: AppLocalizations.of(context)!.technology,
        imagePath: AssetsManager.technologyDark,
      ),
      CategoryModel(
        id: 'entertainment',
        title: AppLocalizations.of(context)!.entertainment,
        imagePath: AssetsManager.entertainmentDark,
      ),
      CategoryModel(
        id: 'health',
        title: AppLocalizations.of(context)!.health,
        imagePath: AssetsManager.healthDark,
      ),
      CategoryModel(
        id: 'science',
        title: AppLocalizations.of(context)!.science,
        imagePath: AssetsManager.scienceDark,
      ),
    ];
    List<CategoryModel> categoriesLight = [
      CategoryModel(
        id: 'general',
        title: AppLocalizations.of(context)!.general,
        imagePath: AssetsManager.generalLight,
      ),
      CategoryModel(
        id: 'business',
        title: AppLocalizations.of(context)!.business,
        imagePath: AssetsManager.businessLight,
      ),
      CategoryModel(
        id: 'sports',
        title: AppLocalizations.of(context)!.sports,
        imagePath: AssetsManager.sportsLight,
      ),
      CategoryModel(
        id: 'technology',
        title: AppLocalizations.of(context)!.technology,
        imagePath: AssetsManager.technologyLight,
      ),
      CategoryModel(
        id: 'entertainment',
        title: AppLocalizations.of(context)!.entertainment,
        imagePath: AssetsManager.entertainmentLight,
      ),
      CategoryModel(
        id: 'health',
        title: AppLocalizations.of(context)!.health,
        imagePath: AssetsManager.healthLight,
      ),
      CategoryModel(
        id: 'science',
        title: AppLocalizations.of(context)!.science,
        imagePath: AssetsManager.scienceLight,
      ),
    ];
    return homeProvider.currentTheme == ThemeMode.dark
        ? categoriesDark
        : categoriesLight;
  }
}
