import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/provider/articles_provider.dart';
import 'package:news/provider/search_provider.dart';
import 'package:news/screens/home_screen/sources_view/widgets/custom_list_view.dart';
import 'package:news/screens/search_screen/widgets/custom_search_bar.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/error_state_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchProvider _searchProvider;
  String _searchedValue = '';
  late TextEditingController _searchController;

  Future<void> _loadData() async {
    _searchProvider = SearchProvider();
    _searchController = TextEditingController();
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
                      return CustomListView(articles: state.article);
                    case ArticlesLoadingState():
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                          ),
                        ),
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
