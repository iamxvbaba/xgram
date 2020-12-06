import 'package:flutter/material.dart' hide SearchDelegate;
import 'package:flutter/material.dart';
import 'search_results.dart';
import 'search_suggestions.dart';

class DefaultSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    var theme = Theme.of(context);
    return super.appBarTheme(context).copyWith(
        primaryColor: theme.scaffoldBackgroundColor,
        primaryColorBrightness: theme.brightness);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
            showSuggestions(context);
          }
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    debugPrint('buildResults-query' + query);
    if (query.length > 0) {
      return SearchResults(keyword: query);
    }
    return SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchSuggestions(delegate: this);
  }

  @override
  void close(BuildContext context, result) {
    super.close(context, result);
  }
}
