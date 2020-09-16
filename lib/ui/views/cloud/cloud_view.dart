import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider_start/core/localization/localization.dart';
import 'package:provider_start/ui/widgets/stateless/loading_animation.dart';
import 'package:stacked/stacked.dart';

import 'cloud_view_model.dart';

class CloudView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return ViewModelBuilder<CloudViewModel>.reactive(
      viewModelBuilder: () => CloudViewModel(),
      builder: (context, model, child) => PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text('Music'),
          cupertino: (_, __) => CupertinoNavigationBarData(
            transitionBetweenRoutes: false,
          ),
        ),
        body: model.isBusy ? _LoadingAnimation() : _Posts(),
      ),
    );
  }
}

class _ItemNavigator extends StatelessWidget {
  final IconData icon;

  final String text;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: <Widget>[
              Material(
                shape: CircleBorder(),
                elevation: 5,
                child: ClipOval(
                  child: Container(
                    width: 40,
                    height: 40,
                    color: Theme.of(context).primaryColor,
                    child: Icon(
                      icon,
                      color: Theme.of(context).primaryIconTheme.color,
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 8)),
              Text(text),
            ],
          ),
        ));
  }

  _ItemNavigator(this.icon, this.text, this.onTap);
}

class _Posts extends ViewModelWidget<CloudViewModel> {
  @override
  Widget build(BuildContext context, CloudViewModel model) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _ItemNavigator(Icons.radio, '私人FM', () {}),
              _ItemNavigator(Icons.today, '每日推荐', () {}),
              _ItemNavigator(Icons.show_chart, '排行榜', () {}),
            ],
          ),
        ),
      ],
    );
  }
}

class _LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimation(),
    );
  }
}
