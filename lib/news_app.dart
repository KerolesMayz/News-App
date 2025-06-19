import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/config/theme/theme_manager.dart';
import 'package:news/core/extension/context_extension.dart';
import 'package:provider/provider.dart';

import 'core/routes_manager/routes_manager.dart';
import 'provider/home_provider.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return ScreenUtilInit(
      designSize: Size(context.width, context.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.lightTheme,
        darkTheme: ThemeManager.darkTheme,
        initialRoute: RoutesManager.home,
        themeMode: homeProvider.currentTheme,
        onGenerateRoute: RoutesManager.router,
        locale: const Locale('en'),
      ),
    );
  }
}
