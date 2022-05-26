import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class UserRepository {
  late User _user;

  Future getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
          () => _user = MyUser(userId: _user.uid) as User,
    );
  }
}