import 'package:flutter/material.dart' hide SearchDelegate;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchSuggestions<T> extends StatelessWidget {
  final SearchDelegate<T> delegate;

  SearchSuggestions({@required this.delegate});

  @override
  Widget build(BuildContext context) {
    return Text('推荐搜索');
  }
}
