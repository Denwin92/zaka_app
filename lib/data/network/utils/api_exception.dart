class APIException implements Exception {
  APIException(this.message);

  final String message;
}

class InvalidCredentialsException extends APIException {
  InvalidCredentialsException() : super('Incorrect login details provided');
}

class NoInternetConnectionException extends APIException {
  NoInternetConnectionException() : super('No Internet connection');
}

class FailedTransferException extends APIException {
  FailedTransferException() : super('Transfer Failed.');
}

class UnknownException implements Exception {
  UnknownException();}