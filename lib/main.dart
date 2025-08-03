import 'package:flutter/material.dart';
import 'package:news/provider/home_provider.dart';
import 'package:provider/provider.dart';

import 'news_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final HomeProvider homeProvider = HomeProvider();
  await homeProvider.loadThemeFromPrefs();
  await homeProvider.loadLangFromPrefs();
  runApp(
    ChangeNotifierProvider.value(value: homeProvider, child: const NewsApp()),
  );
}
