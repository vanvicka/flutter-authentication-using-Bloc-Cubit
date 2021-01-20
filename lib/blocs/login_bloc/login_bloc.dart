import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/blocs/cubit/auth_cubit.dart';
import 'package:flutter_app/data/auth_service.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthCubit _authCubit;
  final AuthenticationService _authService;

  LoginBloc(AuthCubit authCubit, AuthenticationService authService)
      : assert(authCubit != null),
        assert(authService != null),
        _authCubit = authCubit,
        _authService = authService,
        super(LoginInitial());


   @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInWithEmailButtonPressed) {
      yield* _mapLoginWithEmailToState(event);
    }
  }

  Stream<LoginState> _mapLoginWithEmailToState(LoginInWithEmailButtonPressed event) async* {
    yield LoginLoading();
    try {
      final user = await _authService.logIn(event.email, event.password);
      if (user != null) {
        print("user : $user");
        _authCubit.userLoggedIn(user);
        yield LoginSuccess();
      } else {
        yield LoginFailure(error: 'Something could be wrong, check your data connection');
      }
    } catch (err) {
      yield LoginFailure(error: err.message ?? 'An unknown error occured');
    }
  }
}

