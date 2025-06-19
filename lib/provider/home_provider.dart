import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/home_screen/categories_view/categories_view.dart';
import 'package:news/screens/home_screen/sources_view/sources_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  Widget view = const CategoriesView();
  ThemeMode currentTheme = ThemeMode.light;
  String currentLang = 'en';
  String? title;

  void goToSourcesView(CategoryModel category) {
    view = SourcesView(category: category);
    title = category.title;
    notifyListeners();
  }

  void changeTheme(String theme) async {
    ThemeMode newTheme = theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  void changeLang(String newLang) async {
    if (currentLang == newLang) return;
    currentLang = newLang;
    notifyListeners();
  }

  Future<void> loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString('appTheme') ?? 'light';
    if (themeString == 'dark') {
      currentTheme = ThemeMode.dark;
    } else {
      currentTheme = ThemeMode.light;
    }
    notifyListeners();
  }

  Future<void> loadLangFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final lang = prefs.getString('appLang') ?? 'en';
    currentLang = lang;
    notifyListeners();
  }

  Future<void> toggleTheme(String newTheme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('appTheme', newTheme);

    notifyListeners();
  }

  Future<void> toggleLang(String newLang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('appLang', newLang);

    notifyListeners();
  }

  void goToCategoriesView() {
    if (view == const CategoriesView()) return;
    view = const CategoriesView();
    title = null;
    notifyListeners();
  }
}
