import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.controller,
    required this.itemBuilder,
    required this.itemCount
  });

  final ScrollController controller;
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;


  // int page = 1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: ListView.separated(
              controller: controller,
              padding: REdgeInsets.all(16),
              itemBuilder: itemBuilder,
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.h);
              },
              itemCount: itemCount,
            ),
          );
  }
}
