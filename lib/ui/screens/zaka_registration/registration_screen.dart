import 'package:e_group_x/provider/registration_provider.dart';
import 'package:e_group_x/resources/screen_routes.dart';
import 'package:e_group_x/ui/screens/zaka_registration/sub_screens/step_one_sub.dart';
import 'package:e_group_x/ui/screens/zaka_registration/sub_screens/step_three_sub.dart';
import 'package:e_group_x/ui/screens/zaka_registration/sub_screens/step_two_sub.dart';
import 'package:e_group_x/widgets/loader_overlay.dart';
import 'package:e_group_x/widgets/toasties.dart';
import 'package:e_group_x/widgets/zaka_app_bar.dart';
import 'package:e_group_x/widgets/zaka_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final List<GlobalKey<FormState>> _formKeys =
      List.generate(3, (_) => GlobalKey<FormState>());
  late RegistrationProvider _registrationProvider;

  @override
  void initState() {
    super.initState();
    _registrationProvider = context.read<RegistrationProvider>()
      ..addListener(_registrationProviderListener);
  }

  @override
  void dispose() {
    _registrationProvider.removeListener(_registrationProviderListener);
    super.dispose();
  }

  Widget _buildSubScreen(int stepIndex) {
    if (stepIndex == 0) {
      return StepOneSubScreen(formKey: _formKeys[0]);
    }
    if (stepIndex == 1) {
      return StepTwoSubScreen(formKey: _formKeys[1]);
    }
    return StepThreeSubScreen(formKey: _formKeys[2]);
  }

  void _registrationProviderListener() {
    if (_registrationProvider.registrationStatus.getState.isLoading) {
      LoaderOverlay.show(context);
    } else if (_registrationProvider.registrationStatus.getState.isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
          context, loginScreen, (Route<dynamic> route) => false);
      Toasties.success(context,
          "Account created successfully. You will be transferred to the login screen.");
    } else if (_registrationProvider.registrationStatus.getState.isFailed) {
      Navigator.pop(context);
      Toasties.failed(
          context, _registrationProvider.registrationStatus.getMessage);
    }
  }

  void _onNextPressed() {
    if (_registrationProvider.stepIndex < 2) {
      final formState =
          _formKeys[_registrationProvider.stepIndex].currentState!;
      if (formState.validate()) {
        formState.save();
        _registrationProvider.nextStep();
      }
    } else if (_registrationProvider.stepIndex == 2) {
      final formState = _formKeys[2].currentState!;
      if (formState.validate()) {
        formState.save();
        _registrationProvider.createAccount();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ZakaAppBar(),
        body: Consumer<RegistrationProvider>(
          builder: (_, provider, __) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: Image.asset("assets/images/Zaka_logo.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 7.5),
                          child: Text(
                            provider.getTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        _buildSubScreen(provider.stepIndex),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ZakaButton(
                          isEnabled: provider.stepIndex > 0,
                          buttonText: 'Previous',
                          onPressed: () => provider.previousStep(),
                          minWidth: 60),
                      ZakaButton(
                          buttonText:
                              provider.stepIndex == 2 ? "Submit" : 'Next',
                          onPressed: () => _onNextPressed(),
                          minWidth: 90)
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
