import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_group_x/data/network/utils/api_enums.dart';
import 'package:http/http.dart';

import 'api_exception.dart';

class ApiRequests {
  final Client client = Client();

  static final ApiRequests _instance = ApiRequests._internal();

  ApiRequests._internal();

  static ApiRequests get instance => _instance;

  Future<bool> get _isConnected async {
    // return true;
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    return (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi));
  }

  Future makeRequest(
      {required String path,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? requestBody,
      RequestType requestType = RequestType.post}) async {
    if (!await _isConnected) {
      throw NoInternetConnectionException();
    }
    try {
      late Response response;
      if (requestType.isGet) {
        response = await client.get(
          Uri.http("3.89.30.205:8080", path, queryParameters),
        );
      } else {
        response = await client.post(
          Uri.http("3.89.30.205:8080", path),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(requestBody),
        );
      }
      if (response.statusCode == 401) {
        throw InvalidCredentialsException();
      } else if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes))
            as Map<String, dynamic>;
      }
    } on Exception catch (e) {
      throw UnknownException();
    }

  }
}
