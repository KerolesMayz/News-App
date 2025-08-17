import 'package:flutter/material.dart';
import 'package:news/domain/entities/source_entity.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.sources, required this.onTap});

  final List<SourceEntity> sources;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: sources.length,
      child: TabBar(
        onTap: onTap,
        isScrollable: true,
        tabs: sources.map((source) => Tab(text: source.name)).toList(),
      ),
    );
  }
}
