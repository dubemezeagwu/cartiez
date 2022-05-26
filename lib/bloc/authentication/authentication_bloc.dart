import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cartiez/data/models/user.dart';
import 'package:cartiez/data/repository/authentication_repository.dart';
import 'package:cartiez/data/repository/user_repository.dart';
import 'package:cartiez/data/services/authentication/authentication_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {


  final AuthenticationService _authenticationService;
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription <AuthenticationStatus> _authenticationStatusSubscription;

  AuthenticationBloc(this._authenticationService, {
    required AuthenticationService authenticationService,
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository
  }) : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,

        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
            (status) => add(AuthenticationStatusChanged(status))
    );
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }
  Future? _onAuthenticationStatusChanged (AuthenticationStatusChanged event, Emitter<AuthenticationState> emit) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit (const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        final user = await _tryGetUser();
        return emit  (AuthenticationState.authenticated(user!) ?? const AuthenticationState.unknown());
      default:
        return emit (const AuthenticationState.unknown());
    }
  }

  void _onAuthenticationLogoutRequested (AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) {
    _authenticationRepository.logOut();
  }

  Future<MyUser?> _tryGetUser () async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } catch (_){
      return null;
    }
  }
}
