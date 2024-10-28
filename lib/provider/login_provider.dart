import 'package:e_group_x/data/models/account.dart';
import 'package:e_group_x/data/network/repositories/account_repository.dart';
import 'package:e_group_x/data/network/utils/api_status.dart';
import 'package:e_group_x/widgets/toasties.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{

  String? username;
  String? password;
  final AccountsRepository accountsRepository = AccountsRepository();
  final ApiStatus<Account> loginStatus = ApiStatus();

   void login()async {
     loginStatus.loading();
     notifyListeners();
     await accountsRepository.login(username!, password!).then((value){
       loginStatus.success(value);
     },
     onError: (e){
       loginStatus.failed(e);
     });
     notifyListeners();

   }


}