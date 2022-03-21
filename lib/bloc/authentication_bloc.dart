
import 'package:rxdart/rxdart.dart';

import '../data/services/authentication/authentication_service.dart';

class AuthenticationBloc {
  
  final AuthenticationService _authenticationService = AuthenticationService();
  final BehaviorSubject<AuthenticationService> _behaviorSubject = BehaviorSubject<AuthenticationService>();
  
  Future registerUser (String email, String password) async {
    await _authenticationService.signInWithEmailAndPassword(email, password);
  }
}