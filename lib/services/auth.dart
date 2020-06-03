
import 'package:firebase_auth/firebase_auth.dart';
import 'package:focusv1/services/models/user.dart';

class AuthService {

  AuthService._internal();
  static final AuthService _singleton = AuthService._internal();
  factory AuthService() {
    return _singleton;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream to check that user is logging in and out
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  // Convert to user
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? new User(uid: user.uid) : null;
  }

  // Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user =  _userFromFirebaseUser(result.user);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}