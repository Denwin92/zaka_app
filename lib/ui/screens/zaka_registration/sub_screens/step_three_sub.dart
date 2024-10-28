import 'package:e_group_x/provider/registration_provider.dart';
import 'package:e_group_x/widgets/zaka_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../resources/e_validators.dart';

class StepThreeSubScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const StepThreeSubScreen({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final RegistrationProvider provider = context.read<RegistrationProvider>();
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFieldWidget(
            hintText: "Password",
            iconData: Icons.password,
            obscureText: true,
            validator: (value) {
              return EValidators.instance.validateTextField(value);
            },
            onSaved: (value) {
              provider.account.password = value;
            },
          ),
        ],
      ),
    );
  }
}
