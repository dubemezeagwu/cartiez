part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AuthenticationStartedEvent extends AuthenticationEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
