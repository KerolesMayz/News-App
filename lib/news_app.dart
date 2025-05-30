import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/config/theme/theme_manager.dart';

import 'core/routes_manager/routes_manager.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (_, context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.lightTheme,
        darkTheme: ThemeManager.darkTheme,
        initialRoute: RoutesManager.home,
        themeMode: ThemeMode.dark,
        routes: RoutesManager.routes,
        locale: Locale('en'),
      ),
    );
  }
}
