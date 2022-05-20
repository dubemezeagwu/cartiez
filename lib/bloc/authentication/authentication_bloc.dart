import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cartiez/data/repository/user_repository.dart';
import 'package:cartiez/data/services/authentication/authentication_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  AuthenticationState get initialState => AuthenticationInitial();

  final AuthenticationService _authenticationService;

  AuthenticationBloc(this._authenticationService) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>(_onAuthenticationRequested);
  }

  void _onAuthenticationRequested (AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationInProgressSate());
    try {
      final Future<bool> isSignedIn = _authenticationService.isSignedIn();
      if (isSignedIn == true){
        var user = await _authenticationService.getCurrentUser();
        emit(AuthenticatedState(user: user));
      }
    }catch (_){
      emit(AuthenticationFailedState());
    }
  }
}
