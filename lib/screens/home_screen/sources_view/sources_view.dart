import 'package:flutter/material.dart';
import 'package:news/provider/articles_provider.dart';
import 'package:news/provider/sources_view_provider.dart';
import 'package:news/screens/home_screen/sources_view/widgets/custom_list_view.dart';
import 'package:news/screens/home_screen/sources_view/widgets/custom_tab_bar.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/error_state_widget.dart';
import '../../../models/category_model.dart';

class SourcesView extends StatefulWidget {
  const SourcesView({super.key, required this.category});

  final CategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesViewProvider _sourcesViewProvider;
  late ArticlesProvider _articlesProvider;

  void loadData() async {
    _sourcesViewProvider = SourcesViewProvider();
    _articlesProvider = ArticlesProvider();
    await _sourcesViewProvider.loadSources(widget.category);
    await _articlesProvider.loadArticles(_sourcesViewProvider.firstSource);
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _sourcesViewProvider),
        ChangeNotifierProvider.value(value: _articlesProvider)
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Consumer<SourcesViewProvider>(
            builder: (context, viewModel, child) {
              SourcesState state = viewModel.state;
              switch (state) {
                case SourcesLoadingState():
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case SourcesErrorState():
                  return ErrorStateWidget(
                    exception: state.exception,
                    serverError: state.serverError,
                  );
                case SourcesSuccessState():
                  return CustomTabBar(
                    sources: state.sources,
                    onTap: (index) {
                      _articlesProvider.loadArticles(state.sources[index]);
                    },
                  );
              }
            },
          ),
          Consumer<ArticlesProvider>(
            builder: (context, articlesProvider, child) {
              ArticlesState state = articlesProvider.state;
              switch (state) {
                case ArticlesSuccessState():
                  return CustomListView(articles: state.article);
                case ArticlesLoadingState():
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                case ArticlesErrorState():
                  return ErrorStateWidget(
                    exception: state.exception,
                    serverError: state.serverError,
                  );
              }
            },
          )
        ],
      ),
    );
  }
}
