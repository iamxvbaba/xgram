import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider_start/core/models/user/user.dart';
import 'package:provider_start/ui/widgets/stateful/contact_tile/contact_tile_view_model.dart';
import 'package:stacked/stacked.dart';

class ContactTile extends StatelessWidget {
  final User user;

  const ContactTile({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactTileViewModel>.nonReactive(
      viewModelBuilder: () => ContactTileViewModel(),
      onModelReady: (model) => model.init(user),
      builder: (context, model, child) => PlatformWidget(
        material: (_, __) => Card(
          child: ListTile(
            title: Text(model.user.name),
            subtitle: Text(
              model.user.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            isThreeLine: true,
            trailing: PlatformWidget(
              material: (_, __) => Icon(Icons.arrow_forward),
              cupertino: (_, __) => Icon(CupertinoIcons.forward),
            ),
            onTap: model.showChatScreen,
          ),
        ),
        cupertino: (_, __) => Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: CupertinoTheme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: Colors.grey,
              ),
            ],
          ),
          child: CupertinoButton(
            onPressed: model.showChatScreen,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.user.name),
                Text(
                  model.user.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CupertinoTheme.of(context).textTheme.textStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
