import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider_start/core/constant/app_icon.dart';
import 'package:provider_start/core/utils/network_utils.dart';

class CustomIcon extends StatelessWidget {
  final int icon;
  final double size;
  final bool isTwitterIcon;
  final bool isFontAwesomeRegular;
  final bool isFontAwesomeSolid;
  final Color color;
  final double paddingIcon;
  CustomIcon(
      {Key key,
      @required this.icon,
      this.size = 40,
      this.isTwitterIcon = true,
      this.isFontAwesomeRegular = false,
      this.isFontAwesomeSolid = false,
      this.color,
      this.paddingIcon = 10});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: isTwitterIcon ? ScreenUtil().setHeight(paddingIcon) : 0),
      child: Icon(
        IconData(icon,
            fontFamily: isTwitterIcon
                ? 'TwitterIcon'
                : isFontAwesomeRegular
                    ? 'AwesomeRegular'
                    : isFontAwesomeSolid ? 'AwesomeSolid' : 'Fontello'),
        size: ScreenUtil().setHeight(size),
        color: color ?? Theme.of(context).primaryColor,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String title;
  final TextStyle style;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final bool softWrap;
  const CustomText(
      {Key key,
      @required this.title,
      this.style,
      this.textAlign = TextAlign.justify,
      this.overflow = TextOverflow.visible,
      this.softWrap = true});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: softWrap,
      key: key,
    );
  }
}

class _ResultMatch {
  bool isUrl;
  String text;
}

class _LinkTextSpan extends TextSpan {
  final Function(String) onHashTagPressed;
  _LinkTextSpan({TextStyle style, String text, this.onHashTagPressed})
      : super(
            style: style,
            text: text,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (onHashTagPressed != null &&
                    (text.substring(0, 1).contains('#') ||
                        text.substring(0, 1).contains('#'))) {
                  onHashTagPressed(text);
                } else {
                  launchURL(text);
                }
              });
}

class UrlText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextStyle urlStyle;
  final Function(String) onHashTagPressed;

  UrlText({this.text, this.style, this.urlStyle, this.onHashTagPressed});

  List<InlineSpan> getTextSpans() {
    var widgets = <InlineSpan>[];
    var reg = RegExp(
        r'([#])\w+| [@]\w+|(https?|ftp|file|#)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]*');
    Iterable<Match> _matches = reg.allMatches(text);
    var resultMatches = <_ResultMatch>[];
    var start = 0;
    for (var match in _matches) {
      if (match.group(0).isNotEmpty) {
        if (start != match.start) {
          var result1 = _ResultMatch();
          result1.isUrl = false;
          result1.text = text.substring(start, match.start);
          resultMatches.add(result1);
        }

        var result2 = _ResultMatch();
        result2.isUrl = true;
        result2.text = match.group(0);
        resultMatches.add(result2);
        start = match.end;
      }
    }
    if (start < text.length) {
      var result1 = _ResultMatch();
      result1.isUrl = false;
      result1.text = text.substring(start);
      resultMatches.add(result1);
    }
    for (var result in resultMatches) {
      if (result.isUrl) {
        widgets.add(_LinkTextSpan(
            onHashTagPressed: onHashTagPressed,
            text: result.text,
            style: urlStyle ?? TextStyle(color: Colors.blue)));
      } else {
        widgets.add(TextSpan(
            text: result.text, style: style ?? TextStyle(color: Colors.black)));
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: getTextSpans()),
    );
  }
}

class CustomInkWell extends StatelessWidget {
  final Widget child;
  final Function(bool, int) func1;
  final Function onPressed;
  final bool isEnable;
  final int no;
  final Color color;
  final Color splashColor;
  final BorderRadius radius;
  const CustomInkWell(
      {this.child,
      this.func1,
      this.onPressed,
      this.isEnable = false,
      this.no = 0,
      this.color = Colors.transparent,
      this.splashColor,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        borderRadius: radius,
        onTap: () {
          if (func1 != null) {
            func1(isEnable, no);
          } else if (onPressed != null) {
            onPressed();
          }
        },
        splashColor: splashColor,
        child: child,
      ),
    );
  }
}

Widget customImage(
  BuildContext context,
  String path, {
  double height = 50,
  bool isBorder = false,
}) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.grey.shade100, width: isBorder ? 2 : 0),
    ),
    child: CircleAvatar(
      maxRadius: height / 2,
      backgroundColor: Theme.of(context).cardColor,
      backgroundImage: customAdvanceNetworkImage(path ?? dummyProfilePic),
    ),
  );
}

dynamic customAdvanceNetworkImage(String path) {
  path ??= dummyProfilePic;
  return CachedNetworkImageProvider(
    path ?? dummyProfilePic,
  );
}

void customSnackBar(GlobalKey<ScaffoldState> _scaffoldKey, String msg,
    {double height = 30, Color backgroundColor = Colors.black}) {
  if (_scaffoldKey == null || _scaffoldKey.currentState == null) {
    return;
  }
  _scaffoldKey.currentState.hideCurrentSnackBar();
  final snackBar = SnackBar(
    backgroundColor: backgroundColor,
    content: Text(
      msg,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
  _scaffoldKey.currentState.showSnackBar(snackBar);
}

Widget customTitleText(String title, {BuildContext context}) {
  return Text(
    title ?? '',
    style: TextStyle(
      color: Colors.black87,
      fontFamily: 'HelveticaNeue',
      fontWeight: FontWeight.w900,
      fontSize: 20,
    ),
  );
}
