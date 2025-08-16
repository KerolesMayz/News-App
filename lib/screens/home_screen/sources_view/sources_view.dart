import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/custom_clickable_card.dart';
import 'package:news/data/api_services/api_services.dart';
import 'package:news/data/data_source_implementation/articles_data_source.dart';
import 'package:news/data/data_source_implementation/sources_data_source.dart';
import 'package:news/data/repository_implementation/articles_repository.dart';
import 'package:news/data/repository_implementation/sources_repository.dart';
import 'package:news/provider/articles_view_model.dart';
import 'package:news/provider/sources_view_model.dart';
import 'package:news/screens/home_screen/sources_view/widgets/custom_list_view.dart';
import 'package:news/screens/home_screen/sources_view/widgets/custom_tab_bar.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/error_state_widget.dart';
import '../../../data/models/category_model/category_model.dart';
import '../../../data/models/sources_response/source.dart';
import '../../../data/models/states_models/articles_state.dart';
import '../../../data/models/states_models/sources_state.dart';

class SourcesView extends StatefulWidget {
  const SourcesView({super.key, required this.category});

  final CategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesViewModel _sourcesViewProvider;
  late ArticlesViewModel _articlesProvider;
  late ScrollController _controller;
  int page = 1;
  bool isLoading = false;
  Source currentSource = Source();

  void listener() async {
    if (isLoading) return;
    if (_controller.position.pixels >=
            _controller.position.maxScrollExtent - 200 &&
        _articlesProvider.state is ArticlesSuccessState) {
      if (_articlesProvider.state is ArticlesSuccessState) {
        setState(() {
          isLoading = true;
        });
        page++;
        await _articlesProvider.loadArticles(currentSource, page: page);
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Source _getFirstSource() {
    if (_sourcesViewProvider.state.runtimeType == SourcesSuccessState) {
      currentSource =
          (_sourcesViewProvider.state as SourcesSuccessState).sources[0];
      return (_sourcesViewProvider.state as SourcesSuccessState).sources[0];
    } else {
      return Source();
    }
  }

  void _loadData() async {
    _controller = ScrollController();
    _controller.addListener(listener);
    _sourcesViewProvider = SourcesViewModel(
      repository: SourcesRepositoryImplementation(
        dataSource: SourcesApiDataSourceImplementation(
          apiServices: ApiServices(),
        ),
      ),
    );
    _articlesProvider = ArticlesViewModel(
      repository: ArticlesRepositoryImplementation(
        dataSource: ArticlesApiDataSourceImplementation(
          apiServices: ApiServices(),
        ),
      ),
    );
    await _sourcesViewProvider.loadSources(widget.category);
    await _articlesProvider.loadArticles(_getFirstSource());
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _articlesProvider.dispose();
    _sourcesViewProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _sourcesViewProvider),
        ChangeNotifierProvider.value(value: _articlesProvider),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Consumer<SourcesViewModel>(
            builder: (context, viewModel, child) {
              SourcesState state = viewModel.state;
              switch (state) {
                case SourcesLoadingState():
                  return SizedBox(
                    height: 50.h,
                    width: 50.w,
                    child: const Center(child: CircularProgressIndicator()),
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
          Consumer<ArticlesViewModel>(
            builder: (context, articlesProvider, child) {
              ArticlesState state = articlesProvider.state;
              switch (state) {
                case ArticlesSuccessState():
                  return articlesProvider.articles.isNotEmpty
                      ? CustomListView(
                          controller: _controller,
                          itemBuilder: (context, index) {
                            return index < articlesProvider.articles.length
                                ? CustomClickableCard(
                                    article: articlesProvider.articles[index],
                                  )
                                : Center(child: CircularProgressIndicator());
                          },
                          itemCount: isLoading
                              ? articlesProvider.articles.length + 1
                              : articlesProvider.articles.length,
                        )
                      : Expanded(
                          child: Center(
                            child: Text(
                              'No Articles Were Found',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        );
                case ArticlesLoadingState():
                  return const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                case ArticlesErrorState():
                  return ErrorStateWidget(
                    exception: state.exception,
                    serverError: state.serverError,
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
