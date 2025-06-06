import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/colors_manager/colors_manager.dart';
import '../../../../../models/category_model.dart';
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
            child: Padding(
              padding: REdgeInsets.all(16),
              child: FilledButton(
                onPressed: () {
                  homeProvider.goToSourcesView(category);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          REdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: const Text('View All'),
                    ),
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: ColorsManager.black17.withOpacity(1),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: ColorsManager.white,
                        size: 24.r,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: REdgeInsets.all(16),
              child: FilledButton(
                onPressed: () {
                  homeProvider.goToSourcesView(category);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: ColorsManager.black17.withOpacity(1),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: ColorsManager.white,
                        size: 24.r,
                      ),
                    ),
                    Padding(
                      padding:
                          REdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: const Text('View All'),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
