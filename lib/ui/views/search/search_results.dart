import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider_start/ui/views/search/search_model.dart';
import 'package:provider_start/ui/views/session/conversation_view.dart';
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
              : AnimationLimiter(
                  child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            child: SlideAnimation(
                              verticalOffset: 50,
                              child: FadeInAnimation(
                                child: InkWell(
                                  onTap: () {},
                                  child: MyConversationView(
                                    title: '名字',
                                    subTitle: '个性签名',
                                    avatar:
                                        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3363295869,2467511306&fm=26&gp=0.jpg',
                                    tag: '',
                                  ),
                                ),
                              ),
                            ));
                      }),
                ),
        ),
      ),
    );
  }
}
