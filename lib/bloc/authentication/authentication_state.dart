part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationInProgressSate extends AuthenticationState{
  @override
  List<Object?> get props => [];
}

class AuthenticatedState extends AuthenticationState {
  User user;
  AuthenticatedState({required this.user});
  @override
  List<Object?> get props => [];
}

class NotAuthenticatedState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}
