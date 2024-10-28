import 'api_enums.dart';
import 'api_exception.dart';

class ApiStatus<T> {
  ApiState _state = ApiState.initial;
  T? _data;
  String? _message;

  ApiState get getState => _state;

  String get getMessage => _message ?? 'Something went wrong - Please try again.';

  T? get getData => _data;

  void initial() {
    _state = ApiState.initial;
  }

  void loading() {
    _state = ApiState.loading;
  }

  void success(T? data) {
    _data = data;
    _state = ApiState.success;
  }

  void failed(exception) {
    if (exception is APIException){
      _message = exception.message;
    }
    else{
      exception.toString();
    }
    _state = ApiState.failed;
  }}
