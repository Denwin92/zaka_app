class EValidators {
  static final EValidators _instance = EValidators._internal();

  EValidators._internal();

  static EValidators get instance => _instance;

  String? validateEmail(String? value){
    if(validateTextField(value) != null){
      return 'Required';
    }

    String pattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    if(regex.hasMatch(value!)){
      return null;
    }

    return 'Invalid email';

  }

  String? validateTextField(String? value) {
    String? errorMessage;

    if (value == null || value.isEmpty) return "Required";

    return errorMessage;
  }

  String? validateDeleteTextField(String? value) {
    if (value == null || value.isEmpty || value != 'Delete my account') {
      return "Please review your input";
    }

    return null;
  }
}