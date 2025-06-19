import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/colors_manager/colors_manager.dart';

class ThemeManager {
  static final ThemeData lightTheme = ThemeData(
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: ColorsManager.black17),
      primaryColor: ColorsManager.white,
      cardTheme: CardTheme(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorsManager.black17, width: 1.h),
            borderRadius: BorderRadius.circular(16.r)),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: GoogleFonts.inter(
              color: ColorsManager.white,
              fontWeight: FontWeight.w500,
              fontSize: 20.sp),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(color: ColorsManager.white)),
            suffixIconColor: ColorsManager.white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(color: ColorsManager.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(color: ColorsManager.white))),
      ),
      dividerColor: ColorsManager.white,
      iconTheme: const IconThemeData(color: ColorsManager.white),
      drawerTheme:
          const DrawerThemeData(backgroundColor: ColorsManager.black17),
      tabBarTheme: TabBarTheme(
        dividerColor: Colors.transparent,
        labelPadding: REdgeInsets.symmetric(horizontal: 16),
        unselectedLabelColor: ColorsManager.black17,
        unselectedLabelStyle:
            GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14.sp),
        labelStyle:
            GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 16.sp),
        labelColor: ColorsManager.black17,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.h, color: ColorsManager.black17),
            insets: REdgeInsets.symmetric(horizontal: 16)),
      ),
      scaffoldBackgroundColor: ColorsManager.white,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: ColorsManager.black17, size: 24.r),
          foregroundColor: ColorsManager.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          toolbarHeight: 72.h,
          backgroundColor: ColorsManager.white,
          centerTitle: true,
          titleTextStyle: GoogleFonts.inter(
              color: ColorsManager.black17,
              fontWeight: FontWeight.w500,
              fontSize: 20.sp)),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.inter(
            color: ColorsManager.black17,
            fontWeight: FontWeight.w500,
            fontSize: 24.sp,
            height: 1.5.sp,
          ),
          titleMedium: GoogleFonts.inter(
            color: ColorsManager.black17,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            height: 1.5.sp,
          ),
          titleSmall: GoogleFonts.inter(
            color: ColorsManager.grey,
            fontWeight: FontWeight.w700,
            fontSize: 12.sp,
            height: 1.5.sp,
          ),
          headlineLarge: GoogleFonts.inter(
            color: ColorsManager.black17,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
            height: 1.5.sp,
          ),
          headlineMedium: GoogleFonts.inter(
            color: ColorsManager.white,
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
            height: 1.5.sp,
          )),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: ColorsManager.white.withOpacity(0.5),
              foregroundColor: ColorsManager.black17,
              textStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w500, fontSize: 24.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(84.r)))),
      searchBarTheme: SearchBarThemeData(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        textStyle: MaterialStateProperty.all(GoogleFonts.inter(
          color: ColorsManager.black17,
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
          height: 1.5.sp,
        )),
        hintStyle: MaterialStateProperty.all(GoogleFonts.inter(
          color: ColorsManager.black17,
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
          height: 1.5.sp,
        )),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        side: MaterialStateProperty.all(
            const BorderSide(width: 1, color: ColorsManager.black17)),
      ));
  static final ThemeData darkTheme = ThemeData(
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: ColorsManager.white),
      primaryColor: ColorsManager.black17,
      cardTheme: CardTheme(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorsManager.white, width: 1.h),
            borderRadius: BorderRadius.circular(16.r)),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: GoogleFonts.inter(
              color: ColorsManager.white,
              fontWeight: FontWeight.w500,
              fontSize: 20.sp),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(color: ColorsManager.white)),
            suffixIconColor: ColorsManager.white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(color: ColorsManager.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(color: ColorsManager.white))),
      ),
      dividerColor: ColorsManager.white,
      iconTheme: const IconThemeData(color: ColorsManager.white),
      drawerTheme:
          const DrawerThemeData(backgroundColor: ColorsManager.black17),
      tabBarTheme: TabBarTheme(
        dividerColor: Colors.transparent,
        labelPadding: REdgeInsets.symmetric(horizontal: 16),
        unselectedLabelColor: ColorsManager.white,
        unselectedLabelStyle:
            GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14.sp),
        labelStyle:
            GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 16.sp),
        labelColor: ColorsManager.white,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.h, color: ColorsManager.white),
            insets: REdgeInsets.symmetric(horizontal: 16)),
      ),
      scaffoldBackgroundColor: ColorsManager.black17,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: ColorsManager.white, size: 24.r),
          foregroundColor: ColorsManager.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          toolbarHeight: 72.h,
          backgroundColor: ColorsManager.black17,
          centerTitle: true,
          titleTextStyle:
              GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 20.sp)),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.inter(
            color: ColorsManager.white,
            fontWeight: FontWeight.w500,
            fontSize: 24.sp,
            height: 1.5.sp,
          ),
          titleMedium: GoogleFonts.inter(
            color: ColorsManager.white,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            height: 1.5.sp,
          ),
          titleSmall: GoogleFonts.inter(
            color: ColorsManager.grey,
            fontWeight: FontWeight.w700,
            fontSize: 12.sp,
            height: 1.5.sp,
          ),
          headlineLarge: GoogleFonts.inter(
            color: ColorsManager.black17,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
            height: 1.5.sp,
          ),
          headlineMedium: GoogleFonts.inter(
            color: ColorsManager.white,
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
            height: 1.5.sp,
          )),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: ColorsManager.black17.withOpacity(0.5),
              foregroundColor: ColorsManager.white,
              textStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w500, fontSize: 24.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(84.r)))),
      searchBarTheme: SearchBarThemeData(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          textStyle: MaterialStateProperty.all(GoogleFonts.inter(
            color: ColorsManager.white,
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            height: 1.5.sp,
          )),
          hintStyle: MaterialStateProperty.all(GoogleFonts.inter(
            color: ColorsManager.white,
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            height: 1.5.sp,
          )),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          side: MaterialStateProperty.all(
              const BorderSide(width: 1, color: ColorsManager.white)),
          elevation: MaterialStateProperty.all(0)));
}
