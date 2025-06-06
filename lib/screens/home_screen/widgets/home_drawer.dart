import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/colors_manager/colors_manager.dart';
import 'package:provider/provider.dart';

import '../../../provider/home_provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Drawer(
      width: 269.w,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 166.h,
            color: ColorsManager.white,
            child: Text('News App',
                style: Theme.of(context).textTheme.headlineLarge),
          ),
          Padding(
            padding: REdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    homeProvider.goToCategoriesView();
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.home_outlined,
                        size: 24.r,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Go To Home',
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                const Divider(),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.format_paint_outlined,
                      size: 24.r,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      'Theme',
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  padding: REdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border:
                          Border.all(width: 1.h, color: ColorsManager.white)),
                  child: DropdownMenu(
                      onSelected: (theme) {
                        homeProvider.changeTheme(theme);
                      },
                      initialSelection:
                          homeProvider.currentTheme == ThemeMode.dark
                              ? 'dark'
                              : 'light',
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: 'dark', label: 'Dark'),
                        DropdownMenuEntry(value: 'light', label: 'Light'),
                      ]),
                ),
                SizedBox(
                  height: 24.h,
                ),
                const Divider(),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.public,
                      size: 24.r,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      'Language',
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  padding: REdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border:
                          Border.all(width: 1.h, color: ColorsManager.white)),
                  child: DropdownMenu(
                      initialSelection: 'en',
                      dropdownMenuEntries: [
                        DropdownMenuEntry(value: 'en', label: 'English'),
                        DropdownMenuEntry(value: 'ar', label: 'Arabic'),
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
