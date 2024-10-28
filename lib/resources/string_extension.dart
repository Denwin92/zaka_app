import 'package:intl/intl.dart';

extension StringExtensions on String {
  double get currencyInCents {
    return double.parse(this);
  }

  String get getDateOfBirthFromIdNumber {
    String datePart = substring(0, 6);

    int year = int.parse(datePart.substring(0, 2));
    int month = int.parse(datePart.substring(2, 4));
    int day = int.parse(datePart.substring(4, 6));


    year += (year >= 50) ? 1900 : 2000;

    DateTime date = DateTime(year, month, day);

    return DateFormat('dd-MM-yyyy').format(date);
  }
}
