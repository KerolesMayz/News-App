import 'package:flutter/material.dart';
import 'package:news/core/routes_manager/routes_manager.dart';
import 'package:news/provider/home_provider.dart';
import 'package:news/screens/home_screen/widgets/home_drawer.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: Text(homeProvider.title ?? AppLocalizations.of(context)!.home),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesManager.search);
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: homeProvider.view,
    );
  }
}
