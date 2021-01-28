import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_start/core/localization/localization.dart';
import 'package:provider_start/ui/views/settings/settings_view_model.dart';
import 'package:stacked/stacked.dart';

/// An example settings view that uses platform adaptive widgets
/// and builds widgets using the `provider_architecture` package,
class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return ViewModelBuilder<SettingsViewModel>.nonReactive(
      viewModelBuilder: () => SettingsViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(local.settingsViewTitle),
        ),
        body: ListView(
          children: <Widget>[
            _AppSettingsListTile(),
            _NotificationsListTile(),
            _ShowSnackBarListTile(),
            _SignOutListTile()
          ],
        ),
      ),
    );
  }
}

class _AppSettingsListTile extends ViewModelWidget<SettingsViewModel> {
  const _AppSettingsListTile({Key key}) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, SettingsViewModel model) {
    final local = AppLocalizations.of(context);

    return ListTile(
      title: Text(local.settingsViewAppSettings),
      subtitle: Text(local.settingsViewAppSettingsDesc),
      trailing: Icon(Icons.launch),
      onTap: model.openAppSettings,
    );
  }
}

class _NotificationsListTile extends ViewModelWidget<SettingsViewModel> {
  const _NotificationsListTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, SettingsViewModel model) {
    final local = AppLocalizations.of(context);

    return ListTile(
      onTap: model.toggleNotificationsEnabled,
      title: Text(local.settingsViewNotifications),
      subtitle: Text(local.settingsViewNotificationsDesc),
      trailing: Switch.adaptive(
        value: model.notificationsEnabled,
        onChanged: (_) => model.toggleNotificationsEnabled(),
      ),
    );
  }
}

class _SignOutListTile extends ViewModelWidget<SettingsViewModel> {
  const _SignOutListTile({Key key}) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, SettingsViewModel model) {
    final local = AppLocalizations.of(context);

    return ListTile(
      title: Text(local.settingsViewSignOut),
      subtitle: Text(local.settingsViewSignOutDesc),
      trailing: Icon(Icons.exit_to_app),
      onTap: model.signOut,
    );
  }
}

class _ShowSnackBarListTile extends ViewModelWidget<SettingsViewModel> {
  const _ShowSnackBarListTile({Key key}) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, SettingsViewModel model) {
    final local = AppLocalizations.of(context);

    return ListTile(
      title: Text(local.settingsViewSnackBar),
      subtitle: Text(local.settingsViewSnackBarDesc),
      trailing: Icon(Icons.announcement),
      onTap: model.showSnackbar,
    );
  }
}
