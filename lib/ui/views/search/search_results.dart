import 'package:flutter/material.dart';
import 'package:provider_start/ui/views/search/search_model.dart';
import 'package:provider_start/ui/widgets/stateless/loading_animation.dart';
import 'package:stacked/stacked.dart';

class SearchResults extends StatefulWidget {
  final String keyword;

  const SearchResults({Key key, this.keyword}) : super(key: key);

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchModel>.reactive(
      viewModelBuilder: () => SearchModel(),
      onModelReady: (model) => model.search(widget.keyword),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: model.isBusy
              ? LoadingAnimation()
              : ListView.builder(
                  itemCount: 100,
                  itemExtent: 50.0, //强制高度为50.0
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text('$index'));
                  }),
        ),
      ),
    );
  }
}
