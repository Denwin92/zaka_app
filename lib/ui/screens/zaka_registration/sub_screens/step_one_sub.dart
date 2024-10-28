import 'dart:math';

import 'package:e_group_x/main.dart';
import 'package:e_group_x/provider/registration_provider.dart';
import 'package:e_group_x/resources/e_validators.dart';
import 'package:e_group_x/widgets/zaka_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StepOneSubScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const StepOneSubScreen({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    final RegistrationProvider provider = context.read<RegistrationProvider>();

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldWidget(
              hintText: "First Name",
              iconData: Icons.person,
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
      ),
    );
  }
}
