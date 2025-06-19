import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return DropdownMenu(
        width: 269.w - 32.r,
        onSelected: onSelected,
        initialSelection: initialSelection,
        dropdownMenuEntries: dropdownMenuEntries);
  }
}
