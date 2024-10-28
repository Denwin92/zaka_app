import 'package:e_group_x/provider/registration_provider.dart';
import 'package:e_group_x/resources/e_validators.dart';
import 'package:e_group_x/widgets/zaka_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class StepTwoSubScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const StepTwoSubScreen({super.key, required this.formKey});

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
            hintText: "Street Number",
            iconData: Icons.location_on_outlined,
            textInputType: TextInputType.number,
            initialValue: provider.account.streetNumber,
            textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
            validator: (value) {
              return EValidators.instance.validateTextField(value);
            },
            onSaved: (value) {
              provider.account.streetNumber = value;
            },
          ),
          TextFieldWidget(
            hintText: "Street Name",
            iconData: Icons.location_on_outlined,
            initialValue: provider.account.streetName,
            validator: (value) {
              return EValidators.instance.validateTextField(value);
            },
            onSaved: (value) {
              provider.account.streetName = value;
            },
          ),
          TextFieldWidget(
            hintText: "Suburb",
            iconData: Icons.location_on_outlined,
            initialValue: provider.account.suburb,
            validator: (value) {
              return EValidators.instance.validateTextField(value);
            },
            onSaved: (value) {
              provider.account.suburb = value;
            },
          ),
          TextFieldWidget(
            hintText: "City",
            iconData: Icons.location_on_outlined,
            initialValue: provider.account.city,
            validator: (value) {
              return EValidators.instance.validateTextField(value);
            },
            onSaved: (value) {
              provider.account.city = value;
            },
          ),
          TextFieldWidget(
            hintText: "Province",
            initialValue: provider.account.province,
            iconData: Icons.location_on_outlined,
            validator: (value) {
              return EValidators.instance.validateTextField(value);
            },
            onSaved: (value) {
              provider.account.province = value;
            },
          ),
        ],
      ),
    );
  }
}
