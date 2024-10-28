import 'package:e_group_x/data/models/transaction.dart';
import 'package:e_group_x/data/network/utils/api_request.dart';

class TransactionRepository {
  Future<Transaction> makeTransaction(Transaction transaction) async {
    var json = await ApiRequests.instance.makeRequest(
        path: '/api/transactions/transfer', requestBody: transaction.toJson);
    return Transaction.fromJson(json['data']['transaction']);
  }
}
