import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider_start/core/localization/localization.dart';
import 'package:provider_start/ui/widgets/stateful/contact_tile/contact_tile.dart';
import 'package:provider_start/ui/widgets/stateless/loading_animation.dart';
import 'package:stacked/stacked.dart';

import 'contact_view_model.dart';

class ContactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactViewModel>.reactive(
      viewModelBuilder: () => ContactViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text('contact'),
          cupertino: (_, __) => CupertinoNavigationBarData(
            transitionBetweenRoutes: false,
          ),
        ),
        body: model.isBusy
            ? _LoadingAnimation()
            : model.contacts.isNotEmpty ? _Contacts() : _NoContacts(),
      ),
    );
  }
}

class _Contacts extends ViewModelWidget<ContactViewModel> {
  @override
  Widget build(BuildContext context, ContactViewModel model) {
    return ListView.builder(
      itemCount: model.contacts.length,
      itemBuilder: (context, index) => ContactTile(
        key: Key('${model.contacts[index].id}'),
        user: model.contacts[index],
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

class _NoContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('no contact'),
    );
  }
}
