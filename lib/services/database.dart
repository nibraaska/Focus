import 'package:focusv1/services/auth.dart';
import 'package:focusv1/services/models/user.dart';

class DatabaseService{

  DatabaseService._internal();
  static final DatabaseService _singleton = DatabaseService._internal();
  factory DatabaseService() {
    return _singleton;
  }
}