// User model for Firebase login.
import 'package:equatable/equatable.dart';

class MyUser extends Equatable{

  final String userId;

  MyUser({
    required this.userId
  });

  @override
  List<Object?> get props => [userId];

  static const empty = const MyUser(userId: "_");
}