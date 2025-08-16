import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/custom_clickable_card.dart';
import 'package:news/data/api_services/api_services.dart';
import 'package:news/data/data_source_implementation/search_data_source.dart';
import 'package:news/data/repository_implementation/search_repository.dart';
import 'package:news/provider/search_provider.dart';
import 'package:news/screens/home_screen/sources_view/widgets/custom_list_view.dart';
import 'package:news/screens/search_screen/widgets/custom_search_bar.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/error_state_widget.dart';
import '../../data/models/states_models/articles_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchProvider _searchProvider;
  String _searchedValue = '';
  late ScrollController _controller;
  int page = 1;
  bool isLoading = false;
  late TextEditingController _searchController;

  void listener() async {
    if (isLoading) return;
    if (_controller.position.pixels >=
            _controller.position.maxScrollExtent - 200 &&
        _searchProvider.state is ArticlesSuccessState) {
      if (_searchProvider.state is ArticlesSuccessState) {
        setState(() {
          isLoading = true;
        });
        page++;
        await _searchProvider.loadArticles(_searchedValue, page: page);
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> _loadData() async {
    _controller = ScrollController();
    _searchController = TextEditingController();
    _controller.addListener(listener);
    _searchProvider = SearchProvider(
      repository: SearchRepositoryImplementation(
        dataSource: SearchApiDataSourceImplementation(
          apiServices: ApiServices(),
        ),
      ),
    );
    await _searchProvider.loadArticles('');
  }

  void _onChanged(String value) {
    _searchedValue = value;
  }

  void _onSubmitted(String _) {
    _searchProvider.loadArticles(_searchedValue);
  }

  void _onSearchButtonPress() {
    _searchProvider.loadArticles(_searchedValue);
  }

  void _onCancelButtonPress() {
    setState(() {
      _searchController.text = '';
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _controller.dispose();
    _searchProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchProvider>.value(
      value: _searchProvider,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: REdgeInsets.all(16),
                child: CustomSearchBar(
                  controller: _searchController,
                  onChanged: _onChanged,
                  onSubmitted: _onSubmitted,
                  onCancelButtonPress: _onCancelButtonPress,
                  onSearchButtonPress: _onSearchButtonPress,
                ),
              ),
              Consumer<SearchProvider>(
                builder: (context, searchProvider, child) {
                  ArticlesState state = searchProvider.state;
                  switch (state) {
                    case ArticlesSuccessState():
                      return searchProvider.articles.isNotEmpty
                          ? CustomListView(
                              controller: _controller,
                              itemCount: isLoading
                                  ? searchProvider.articles.length + 1
                                  : searchProvider.articles.length,
                              itemBuilder: (context, index) {
                                return index < searchProvider.articles.length
                                    ? CustomClickableCard(
                                        article: searchProvider.articles[index],
                                      )
                                    : Center(
                                        child: CircularProgressIndicator(),
                                      );
                              },
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
        ),
      ),
    );
  }
}
