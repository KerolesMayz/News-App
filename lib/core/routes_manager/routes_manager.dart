import 'package:flutter/cupertino.dart';
import 'package:news/core/screens/home_screen/home_screen.dart';
import 'package:news/core/screens/search_screen/search_screen.dart';

class RoutesManager {
  static const String home = '/home';
  static const String search = '/search';
  static Map<String, WidgetBuilder> routes = {
    home: (_) => const HomeScreen(),
    search: (_) => const SearchScreen(),
  };
}
