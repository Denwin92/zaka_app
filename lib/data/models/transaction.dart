import 'package:e_group_x/data/models/globals.dart';

class Transaction {
  int? id;
  String? beneficiaryAccountNumber;
  String? beneficiaryBank;
  String? senderAccountNumber;
  String? accountName;
  String? beneficiaryReference;
  String? senderReference;
  double? amount;

  Transaction();

  Transaction.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        beneficiaryAccountNumber = json['beneficiary_account_number'],
        beneficiaryBank = json['beneficiary_bank_name'],
        senderAccountNumber = json['sender_account_number'],
        accountName = json['account_name'],
        beneficiaryReference = json['beneficiary_reference'],
        senderReference = json['beneficiary_reference'],
        amount = json['amount'];

  Map<String,dynamic> get toJson{
    return {
      "beneficiary_account_number": beneficiaryAccountNumber,
      "beneficiary_bank_name" : beneficiaryBank,
      "sender_account_number": Globals.instance.account.accountNumber,
      "account_name": accountName,
      "beneficiary_reference": beneficiaryReference,
      "sender_reference":senderReference,
      "amount":amount
    };
  }
}
