import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user.dart';

class AuthenticationService {

  //Firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth get auth => _auth;

  /* Checks if the firebase user is not null,
  * and gets the userId by accessing
  * uid property of that user.
  */
  MyUser? _userFromFirebaseUser (User user){
    return user != null ? MyUser(userId: user.uid) : null;
  }

  // Sign in a user with email and password provided
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser!);
    }catch(exception){
      print(exception.toString());
    }
  }

  // Create a user with email and password provided.
  Future signUpWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      User? firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser!);
    }catch(exception){
      print(exception.toString());
    }
  }

  // Reset the user's password.
  Future resetPassword (String email) async {
    try{
      return await _auth.sendPasswordResetEmail(email: email);
    }catch(exception){
      print(exception.toString());
    }
  }

  // Sign the user out.
  Future signOut () async {
    try{
      return await _auth.signOut();
    }catch(exception){
      print(exception.toString());
    }
  }
}