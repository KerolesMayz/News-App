import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/constants_manager.dart';
import 'package:provider/provider.dart';

import '../../../../../data/models/category_model.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../provider/home_provider.dart';

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({super.key, required this.index, required this.category});

  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return index % 2 == 0
        ? Align(
            alignment: Alignment.bottomRight,
            child: FilledButton(
              onPressed: () {
                homeProvider.goToSourcesView(category);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: REdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Text(AppLocalizations.of(context)!.view_all),
                  ),
                  CircleAvatar(
                    foregroundColor: ConstantsManager.getContrastingColor(
                      Theme.of(context).primaryColor,
                    ),
                    radius: 30.r,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(Icons.arrow_forward_ios_rounded, size: 24.r),
                  ),
                ],
              ),
            ),
          )
        : Align(
            alignment: Alignment.bottomLeft,
            child: FilledButton(
              onPressed: () {
                homeProvider.goToSourcesView(category);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    foregroundColor: ConstantsManager.getContrastingColor(
                      Theme.of(context).primaryColor,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(Icons.arrow_back_ios_rounded, size: 24.r),
                  ),
                  Padding(
                    padding: REdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Text(AppLocalizations.of(context)!.view_all),
                  ),
                ],
              ),
            ),
          );
  }
}
