part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AuthenticationRequestedEvent extends AuthenticationEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
