import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 24.r),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(text, style: Theme.of(context).textTheme.headlineMedium),
        ),
      ],
    );
  }
}
