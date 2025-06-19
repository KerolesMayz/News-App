import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors_manager/colors_manager.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu(
      {super.key,
      this.onSelected,
      this.initialSelection,
      required this.dropdownMenuEntries});

  final void Function(String?)? onSelected;
  final String? initialSelection;
  final List<DropdownMenuEntry<String>> dropdownMenuEntries;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.only(left: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(width: 1.h, color: ColorsManager.white)),
      child: DropdownMenu(
          onSelected: onSelected,
          initialSelection: initialSelection,
          dropdownMenuEntries: dropdownMenuEntries),
    );
  }
}
