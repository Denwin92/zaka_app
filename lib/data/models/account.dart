import 'package:e_group_x/resources/string_extension.dart';
import 'package:intl/intl.dart';

class Account {

  int? accountNumber;
  String? firstName;
  String? lastName;
  String? cellNumber;
  String? emailAddress;
  String? province;
  String? suburb;
  String? city;
  String? streetNumber;
  String? streetName;
  String? idNumber;
  DateTime? dateOfBirth;
  String? password;

  Account();

  Account.fromJson(Map<String, dynamic> json)
      : accountNumber = json['accountNumber'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        cellNumber = json['cellNumber'],
        emailAddress = json['emailAddress'],
        province = json['province'],
        suburb = json['suburb'],
        city = json['city'],
        streetNumber = json['streetNumber'].toString(),
        streetName = json['streetName'],
        idNumber = json['idNumber'],
        dateOfBirth = DateTime.tryParse(json['dateOfBirth']),
        password = json['password'];

  Map<String, dynamic> get toJson {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'cell_number': cellNumber,
      'email': emailAddress,
      'province': province,
      'suburb': suburb,
      'city': city,
      'street_number': streetNumber,
      'street_name': streetName,
      'id_number': idNumber,
      'dob': idNumber?.getDateOfBirthFromIdNumber,
      'password': password
    };
  }
}
