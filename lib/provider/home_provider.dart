import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/home_screen/categories_view/categories_view.dart';
import 'package:news/screens/home_screen/sources_view/sources_view.dart';

class HomeProvider extends ChangeNotifier {
  Widget view = const CategoriesView();
  ThemeMode currentTheme = ThemeMode.dark;
  String? title;

  void goToSourcesView(CategoryModel category) {
    view = SourcesView(category: category);
    title = category.title;
    notifyListeners();
  }

  void changeTheme(String? theme) {
    if (theme == 'dark') {
      currentTheme = ThemeMode.dark;
      notifyListeners();
    } else if (theme == 'light') {
      currentTheme = ThemeMode.light;
      notifyListeners();
    }
  }

  void goToCategoriesView() {
    if (view == const CategoriesView()) return;
    view = const CategoriesView();
    title = null;
    notifyListeners();
  }
}
