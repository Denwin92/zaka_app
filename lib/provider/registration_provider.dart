import 'package:e_group_x/data/models/account.dart';
import 'package:e_group_x/data/network/repositories/account_repository.dart';
import 'package:e_group_x/data/network/utils/api_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationProvider extends ChangeNotifier {
  int stepIndex = 0;
  final Account account = Account();
  final AccountsRepository accountsRepository = AccountsRepository();
  final ApiStatus<Account> registrationStatus = ApiStatus();

  void createAccount() async {
    registrationStatus.loading();
    notifyListeners();
    await accountsRepository.createAccount(account).then((value) {
      registrationStatus.success(value);

    }, onError: (e) {
      registrationStatus.failed(e);
    });
    notifyListeners();
  }

  void previousStep() {
    if (stepIndex > 0) {
      stepIndex--;
      notifyListeners();
    }
  }

  void nextStep() {
    if (stepIndex < 3) {
      stepIndex++;
      notifyListeners();
    }
  }

  String get getTitle {
    if (stepIndex == 0) {
      return "Step 1: Contact Details";
    }
    if (stepIndex == 1) {
      return "Step 2: Your Address";
    }
    return "Step 3: Security";
  }
}
