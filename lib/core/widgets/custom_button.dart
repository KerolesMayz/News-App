import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.backGroundColor,
      this.foreGroundColor});

  final VoidCallback? onPressed;
  final String text;
  final Color? backGroundColor;
  final Color? foreGroundColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
            backgroundColor: backGroundColor,
            foregroundColor: foreGroundColor,
            padding: REdgeInsets.all(16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r))),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ));
  }
}
