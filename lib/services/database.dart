import 'package:firebase_database/firebase_database.dart';

class DatabaseService{

  DatabaseService._internal();
  static final DatabaseService _singleton = DatabaseService._internal();
  factory DatabaseService() {
    return _singleton;
  }

  DatabaseReference _ref = FirebaseDatabase().reference();

  Future<List<String>> getCountriesSetUp() async {
    var result = await _ref.child('colleges').once().then((value) => (value.value as Map<dynamic, dynamic>).keys.toList());
    return result.cast<String>();
  }
}