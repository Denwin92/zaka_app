import 'package:e_group_x/data/models/transaction.dart';
import 'package:e_group_x/data/network/repositories/transaction_repository.dart';
import 'package:e_group_x/data/network/utils/api_status.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier{

  final Transaction transaction = Transaction();

  final TransactionRepository transactionRepository = TransactionRepository();
  final ApiStatus<Transaction> transactionStatus = ApiStatus();

  void makeTransaction() async {
    transactionStatus.loading();
    notifyListeners();
    await transactionRepository.makeTransaction(transaction!).then((value){
      transactionStatus.success(value);
    },
    onError: (e){
      transactionStatus.failed(e);

    });
    notifyListeners();

  }


}