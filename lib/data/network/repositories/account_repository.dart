import 'package:e_group_x/data/models/account.dart';
import 'package:e_group_x/data/models/globals.dart';
import 'package:e_group_x/data/network/utils/api_request.dart';

class AccountsRepository {
  Future<Account> createAccount(Account account) async {
    var json = await ApiRequests.instance.makeRequest(
        path: '/api/accounts/create-account', requestBody: account.toJson);
    return Account.fromJson(json['data']['account']);
  }

  Future<Account> login(String username, String password) async {
    var json = await ApiRequests.instance.makeRequest(
        path: 'api/accounts/login',
        requestBody: {'username': username, 'password': password});
    Account account = Account.fromJson(json['data']['account']);;
    Globals.instance.account = account;
    return account;
  }
}
