import 'package:e_group_x/provider/registration_provider.dart';
import 'package:e_group_x/resources/e_validators.dart';
import 'package:e_group_x/widgets/zaka_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class StepOneSubScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const StepOneSubScreen({super.key, required this.formKey});

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
            hintText: "First Name",
            iconData: Icons.person,
            initialValue: provider.account.firstName,
            validator: (value) {
              return EValidators.instance.validateTextField(value);
            },
            onSaved: (value) {
              provider.account.firstName = value;
            },
          ),
          TextFieldWidget(
            hintText: "Last Name",
            iconData: Icons.person,
            initialValue: provider.account.lastName,
            validator: (value) {
              return EValidators.instance.validateTextField(value);
            },
            onSaved: (value) {
              provider.account.lastName = value;
            },
          ),
          TextFieldWidget(
            hintText: "Cell Number",
            iconData: Icons.phone,
            initialValue: provider.account.cellNumber,
            textInputType: TextInputType.phone,
            textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              return EValidators.instance.validateTextField(value);
            },
            onSaved: (value) {
              provider.account.cellNumber = value;
            },
          ),
          TextFieldWidget(
            hintText: "Email Address",
            iconData: Icons.email_outlined,
            initialValue: provider.account.emailAddress,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              return EValidators.instance.validateTextField(value);
            },
            onSaved: (value) {
              provider.account.emailAddress = value;
            },
          ),
          TextFieldWidget(
            hintText: "ID Number",
            iconData: Icons.person,
            textInputType: TextInputType.number,
            initialValue: provider.account.idNumber,
            textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              return EValidators.instance.validateTextField(value);
            },
            onSaved: (value) {
              provider.account.idNumber = value;
            },
          ),
        ],
      ),
    );
  }
}
