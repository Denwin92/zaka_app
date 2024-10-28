import 'package:e_group_x/provider/login_provider.dart';
import 'package:e_group_x/resources/e_validators.dart';
import 'package:e_group_x/resources/screen_routes.dart';
import 'package:e_group_x/widgets/loader_overlay.dart';
import 'package:e_group_x/widgets/toasties.dart';
import 'package:e_group_x/widgets/zaka_button.dart';
import 'package:e_group_x/widgets/zaka_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ZakaLoginScreen extends StatefulWidget {
  const ZakaLoginScreen({super.key});

  @override
  State<ZakaLoginScreen> createState() => _ZakaLoginScreenState();
}

class _ZakaLoginScreenState extends State<ZakaLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late LoginProvider _loginProvider;

  @override
  void initState() {
    super.initState();
    _loginProvider = context.read<LoginProvider>()
      ..addListener(_loginProviderListener);
  }

  @override
  void dispose() {
    _loginProvider.removeListener(_loginProviderListener);
    super.dispose();
  }

  void _onLoginPressed() {
    // Navigator.pushNamed(context, mainMenuScreen);
    final formState = _formKey.currentState!;
    if (formState.validate()) {
      formState.save();
      _loginProvider.login();
    }
  }

  void _loginProviderListener() {
    if (_loginProvider.loginStatus.getState.isLoading) {
      LoaderOverlay.show(context);
    } else if (_loginProvider.loginStatus.getState.isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
          context, mainMenuScreen, (Route<dynamic> route) => false);
    } else if (_loginProvider.loginStatus.getState.isFailed) {
      Navigator.pop(context);
      Toasties.failed(context, _loginProvider.loginStatus.getMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.green, Colors.blue],
            )),
            child: Column(
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/Zaka_logo.png"),
                        const Text('Login',
                            style: TextStyle(
                                color: CupertinoColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal)),
                        TextFieldWidget(
                          hintText: "email or phone number",
                          iconData: Icons.alternate_email,
                          validator: (value) {
                            return EValidators.instance
                                .validateTextField(value);
                          },
                          onSaved: (value) {
                            context.read<LoginProvider>().username =
                                value?.trim();
                          },
                        ),
                        TextFieldWidget(
                            hintText: "Password",
                            iconData: Icons.password,
                            obscureText: true,
                            validator: (value) {
                              return EValidators.instance
                                  .validateTextField(value);
                            },
                            onSaved: (value) {
                              context.read<LoginProvider>().password =
                                  value?.trim();
                            }),
                        ZakaButton(
                            buttonText: 'Login',
                            onPressed: () {
                              _onLoginPressed();
                            }),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, registrationScreen),
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Don't have an account? Sign up here!",
                      style: TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
