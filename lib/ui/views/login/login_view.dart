import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_start/core/localization/localization.dart';
import 'package:provider_start/ui/shared/ui_helper.dart';
import 'package:provider_start/ui/views/login/login_view_model.dart';
import 'package:provider_start/ui/widgets/cupertino/cupertino_text_form_field.dart';
import 'package:provider_start/ui/widgets/stateless/loading_animation.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();

  TextEditingController phoneController;
  TextEditingController codeController;
  FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController(text: '18567913187');
    codeController = TextEditingController(text: '1234');
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    phoneController.dispose();
    codeController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          var currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(local.loginViewTitle),
          ),
          body: Form(
            key: formKey,
            child: IgnorePointer(
              ignoring: model.isBusy,
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      _EmailTextField(
                        controller: phoneController,
                        onFieldSubmitted: (_) =>
                            passwordFocusNode.requestFocus(),
                        /*validator: (_) => local.translate(
                          model.validateEmail(phoneController.text),
                        ),*/
                      ),
                      UIHelper.verticalSpaceMedium(),
                      _PasswordTextField(
                        controller: codeController,
                        focusNode: passwordFocusNode,
                        onFieldSubmitted: (_) {
                          if (!formKey.currentState.validate()) return;
                          model.login(
                            phoneController.text,
                            codeController.text,
                          );
                        },
                        /*
                        validator: (_) => local.translate(
                          model.validatePassword(codeController.text),
                        ),*/
                      ),
                      UIHelper.verticalSpaceMedium(),
                      _SignInButton(
                        busy: model.isBusy,
                        onPressed: () {
                          if (!formKey.currentState.validate()) return;

                          model.login(
                            phoneController.text,
                            codeController.text,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  final bool busy;
  final Function onPressed;

  const _SignInButton({
    Key key,
    this.busy,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return busy
        ? LoadingAnimation()
        : TextButton(
            child: Text(local.loginButton),
            onPressed: onPressed,
          );
  }
}

class _EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function onFieldSubmitted;
  final Function validator;

  const _EmailTextField({
    Key key,
    this.controller,
    this.onFieldSubmitted,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return TextFormField(
      controller: controller,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        hintText: local.emailHint,
        contentPadding: const EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onFieldSubmitted;
  final Function validator;

  const _PasswordTextField({
    Key key,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return TextFormField(
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      //obscureText: true,
      textInputAction: TextInputAction.send,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: local.passwordHint,
        prefixIcon: Icon(Icons.message),
        contentPadding: const EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
