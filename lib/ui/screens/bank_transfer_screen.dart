import 'package:e_group_x/provider/transaction_provider.dart';
import 'package:e_group_x/resources/e_validators.dart';
import 'package:e_group_x/resources/screen_routes.dart';
import 'package:e_group_x/widgets/loader_overlay.dart';
import 'package:e_group_x/widgets/toasties.dart';
import 'package:e_group_x/widgets/zaka_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../widgets/zaka_text_field.dart';

class BankTransferScreen extends StatefulWidget {
  BankTransferScreen({super.key});

  @override
  State<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends State<BankTransferScreen> {
  late TransactionProvider _transactionProvider;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> _banks = ['FNB', 'Standard Bank', 'ABSA', 'Nedbank'];

  @override
  void initState() {
    super.initState();
    _transactionProvider = context.read<TransactionProvider>()
      ..addListener(_transactionProviderListener);
  }

  @override
  void dispose() {
    _transactionProvider.removeListener(_transactionProviderListener);
    super.dispose();
  }

  void _transactionProviderListener() {
    if (_transactionProvider.transactionStatus.getState.isLoading) {
      LoaderOverlay.show(context);
    } else if (_transactionProvider.transactionStatus.getState.isSuccess) {
      Navigator.popUntil(context, ModalRoute.withName(mainMenuScreen));
      Toasties.success(context, 'Payment made successfully.');
    } else if (_transactionProvider.transactionStatus.getState.isFailed) {
      Navigator.pop(context);
      Toasties.failed(context, "Payment Failed, please try again.");
    }
  }

  void _onPayPressed() {
    final formState = _formKey.currentState!;

    if (formState.validate()) {
      formState.save();
      _transactionProvider.makeTransaction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.green],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Bank Transfer",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Please enter details of the payment you would like to make below:',
                            style: TextStyle(color: Colors.black54, fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, top: 7.5, right: 30, bottom: 7.5),
                            child: DropdownButtonFormField<String>(
                                validator: (value) {
                                  return EValidators.instance
                                      .validateTextField(value);
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.business, color: Colors.black54),
                                  hintText: 'Select Bank',
                                  alignLabelWithHint: true,
                                  filled: true,
                                  fillColor: CupertinoColors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(14.0)),
                                      borderSide: BorderSide(color: Colors.yellow, width: 2)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: BorderSide(color: Colors.black54)),
                                ),
                                value:
                                    _transactionProvider.transaction.beneficiaryBank,
                                items: _banks.map((item) {
                                  return DropdownMenuItem<String>(
                                    alignment: Alignment.center,
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  _transactionProvider.transaction.beneficiaryBank =
                                      value;
                                }),
                          ),
                          TextFieldWidget(
                              hintText: "Account Name",
                              iconData: Icons.account_box_outlined,
                              validator: (value) {
                                return EValidators.instance
                                    .validateTextField(value);
                              },
                              onSaved: (value) {
                                _transactionProvider.transaction.accountName =
                                    value;
                              }),
                          TextFieldWidget(
                              hintText: "Account Number",
                              textInputType: TextInputType.number,
                              textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                              iconData: Icons.account_balance_wallet_outlined,
                              validator: (value) {
                                return EValidators.instance
                                    .validateTextField(value);
                              },
                              onSaved: (value) {
                                _transactionProvider
                                    .transaction.beneficiaryAccountNumber = value;
                              }),
                          TextFieldWidget(
                              hintText: "Beneficiary Reference",
                              iconData: Icons.info_outlined,
                              validator: (value) {
                                return EValidators.instance
                                    .validateTextField(value);
                              },
                              onSaved: (value) {
                                _transactionProvider
                                    .transaction.beneficiaryReference = value;
                              }),
                          TextFieldWidget(
                              hintText: "Sender Reference",
                              iconData: Icons.info_outlined,
                              validator: (value) {
                                return EValidators.instance
                                    .validateTextField(value);
                              },
                              onSaved: (value) {
                                _transactionProvider.transaction.senderReference =
                                    value;
                              }),
                          TextFieldWidget(
                              hintText: "Amount",
                              iconData: Icons.monetization_on_outlined,
                              textInputType: TextInputType.number,
                              textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
                              validator: (value) {
                                return EValidators.instance
                                    .validateTextField(value);
                              },
                              onSaved: (value) {
                                _transactionProvider.transaction.amount =
                                    double.tryParse(value!);
                              }),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ZakaButton(
                        buttonText: "Pay",
                        onPressed: () {
                          _onPayPressed();
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
