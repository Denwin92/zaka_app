import 'package:e_group_x/data/models/account.dart';

class Globals {

  late Account account;

  static final Globals _instance = Globals._internal();

  Globals._internal();

  static Globals get instance => _instance;
}