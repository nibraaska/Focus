import 'package:firebase_database/firebase_database.dart';

class DatabaseService{

  DatabaseService._internal();
  static final DatabaseService _singleton = DatabaseService._internal();
  factory DatabaseService() {
    return _singleton;
  }

  DatabaseReference _ref = FirebaseDatabase().reference();

  Future getCountriesSetUp() async {
    try{
      _ref.child('colleges').once().then((DataSnapshot snapshot) {
        Map<dynamic, dynamic> map = snapshot.value;
        print("here");
        return map.keys.toList();
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}