import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/constants_manager.dart';

import '../../../l10n/app_localizations.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onSearchButtonPress,
    this.onCancelButtonPress,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final VoidCallback? onSearchButtonPress;
  final VoidCallback? onCancelButtonPress;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      leading: IconButton(
        onPressed: onSearchButtonPress,
        icon: Icon(
          Icons.search,
          color: ConstantsManager.getContrastingColor(
            Theme.of(context).primaryColor,
          ),
          size: 30.r,
        ),
      ),
      trailing: [
        IconButton(
          onPressed: onCancelButtonPress,
          icon: Icon(
            Icons.close,
            color: ConstantsManager.getContrastingColor(
              Theme.of(context).primaryColor,
            ),
            size: 25.r,
          ),
        ),
      ],
      hintText: AppLocalizations.of(context)!.search,
    );
  }
}
