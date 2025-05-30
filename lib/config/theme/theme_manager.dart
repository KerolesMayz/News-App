import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/colors_manager/colors_manager.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: ColorsManager.dark,
      appBarTheme: AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          toolbarHeight: 72.h,
          backgroundColor: ColorsManager.dark,
          centerTitle: true,
          iconTheme: IconThemeData(color: ColorsManager.white, size: 24.sp),
          titleTextStyle: TextStyle(
              color: ColorsManager.white,
              fontWeight: FontWeight.w500,
              fontSize: 20.sp)),
      textTheme: TextTheme(
          titleLarge: TextStyle(
        color: ColorsManager.white,
        fontWeight: FontWeight.w500,
        fontSize: 24.sp,
        height: 1.5.sp,
      )),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: ColorsManager.dark.withOpacity(0.5),
              foregroundColor: ColorsManager.white,
              textStyle:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 24.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(84.r)))));
}
