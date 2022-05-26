part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {

  final AuthenticationStatus status;
  final MyUser user;

  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = MyUser.empty
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated (MyUser user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated ()
      : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];
}

