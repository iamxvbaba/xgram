import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider_start/ui/views/player/consts.dart';
import 'package:provider_start/ui/views/player/play_list_view_model.dart';
import 'package:provider_start/ui/widgets/stateless/loading_animation.dart';
import 'package:stacked/stacked.dart';

class PlayListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlayListViewModel>.reactive(
      viewModelBuilder: () => PlayListViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => PlatformScaffold(
        body: Center(
          child: model.isBusy ? _LoadingAnimation() : _LibraryView(),
        ),
      ),
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

class _LibraryView extends ViewModelWidget<PlayListViewModel> {
  @override
  Widget build(BuildContext context, PlayListViewModel model) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _Button(
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Text('Fav. Album'),
                _Button(
                  icon: Icon(Icons.more_horiz),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width),
                    gradient: LinearGradient(
                      colors: [shadowColor, lightShadowColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: shadowColor,
                          offset: Offset(8, 6),
                          blurRadius: 12),
                      BoxShadow(
                          color: lightShadowColor,
                          offset: Offset(-8, -6),
                          blurRadius: 12),
                    ],
                  ),
                ),
                Positioned(
                    top: 10,
                    left: 10,
                    right: 10,
                    bottom: 10,
                    child: CircleAvatar(
                        backgroundImage:
                            Image.asset('assets/images/flutter_bird.png')
                                .image)),
              ],
            ),
            Expanded(child: Container()),
            Text(
              'Life Is Good (feat. Drake)',
              style: TextStyle(fontSize: 28, color: textColor),
            ),
            Text(
              'Future',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
            ),
            Expanded(child: Container()),
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  width: double.infinity,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: backgroundColor,
                    boxShadow: [
                      BoxShadow(color: lightShadowColor, offset: Offset(1, 4)),
                      BoxShadow(color: shadowColor, offset: Offset(-1, -4)),
                    ],
                  ),
                ),
                Positioned(
                  top: 2,
                  bottom: 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 36),
                    width: 200,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [seekBarLightColor, seekBarDarkColor],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '1:30',
                    style: TextStyle(fontSize: 20, color: textColor),
                  ),
                  Text(
                    '3:52',
                    style: TextStyle(fontSize: 20, color: textColor),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _Button(
                  icon: Icon(Icons.skip_previous),
                  onTap: () => print('prev'),
                ),
                _Button(
                  icon: Icon(
                    Icons.play_arrow,
                    size: 48,
                    color: seekBarDarkColor,
                  ),
                  radius: 48,
                  onTap: () => print('Play Or Pause'),
                ),
                _Button(
                  icon: Icon(Icons.skip_next),
                  onTap: () => print('next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final Widget icon;
  final double radius;
  final GestureTapCallback onTap;
  _Button(
      {Key key, this.radius = 32, @required this.icon, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: null,
      onTapUp: null,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(radius / 2),
        child: Stack(
          children: <Widget>[
            Container(
              width: radius * 2,
              height: radius * 2,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(radius),
                boxShadow: [
                  BoxShadow(
                      color: shadowColor, offset: Offset(8, 6), blurRadius: 12),
                  BoxShadow(
                      color: lightShadowColor,
                      offset: Offset(-8, -6),
                      blurRadius: 12),
                ],
              ),
            ),
            Positioned.fill(child: icon),
          ],
        ),
      ),
    );
  }
}