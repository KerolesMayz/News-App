import 'package:flutter/cupertino.dart';
import 'package:news/screens/search_screen/search_screen.dart';

import '../../screens/home_screen/home_screen.dart';

class RoutesManager {
  static const String home = '/home';
  static const String search = '/search';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return CupertinoPageRoute(builder: (context) => const HomeScreen());
      case search:
        return CupertinoPageRoute(builder: (context) => const SearchScreen());
    }
    return null;
  }
}
