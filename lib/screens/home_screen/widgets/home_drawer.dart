import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/colors_manager/colors_manager.dart';
import 'package:news/screens/home_screen/widgets/custom_drawer_item.dart';
import 'package:news/screens/home_screen/widgets/custom_drop_down_menu.dart';
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
                  child: CustomDrawerItem(
                    text: AppLocalizations.of(context)!.go_to_home,
                    icon: Icons.home_outlined,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                const Divider(),
                SizedBox(
                  height: 24.h,
                ),
                CustomDrawerItem(
                    text: AppLocalizations.of(context)!.theme,
                    icon: Icons.format_paint_outlined),
                SizedBox(
                  height: 8.h,
                ),
                CustomDropDownMenu(
                    key: ValueKey(homeProvider.currentLang),
                    onSelected: (theme) {
                      homeProvider.changeTheme(theme!);
                      homeProvider.toggleTheme(theme);
                    },
                    initialSelection:
                        homeProvider.currentTheme == ThemeMode.dark
                            ? 'dark'
                            : 'light',
                    dropdownMenuEntries: [
                      DropdownMenuEntry(
                          value: 'dark',
                          label: AppLocalizations.of(context)!.dark),
                      DropdownMenuEntry(
                          value: 'light',
                          label: AppLocalizations.of(context)!.light),
                    ]),
                SizedBox(
                  height: 24.h,
                ),
                const Divider(),
                SizedBox(
                  height: 24.h,
                ),
                CustomDrawerItem(
                    text: AppLocalizations.of(context)!.language,
                    icon: Icons.public),
                SizedBox(
                  height: 8.h,
                ),
                CustomDropDownMenu(
                    onSelected: (newLang) {
                      homeProvider.changeLang(newLang!);
                      homeProvider.toggleLang(newLang);
                    },
                    initialSelection:
                        homeProvider.currentLang == 'en' ? 'en' : 'ar',
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(value: 'en', label: 'English'),
                      DropdownMenuEntry(value: 'ar', label: 'العربية'),
                    ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
