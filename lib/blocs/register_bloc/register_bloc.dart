import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/blocs/cubit/auth_cubit.dart';
import 'package:flutter_app/blocs/cubit/data/auth_service.dart';
import 'package:flutter_app/core/error/exception.dart';


part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(AuthCubit authBloc, AuthenticationService authService)
      : assert(authBloc != null),
        assert(authService != null),
        _authCubit = authBloc,
        _authService = authService,
        super(RegisterInitial());
  final AuthCubit _authCubit;
  final AuthenticationService _authService;
  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event,) async* {
    if (event is SignUp) {
      yield* _mapRegisterEventToState(event);
    }
  }

  Stream<RegisterState> _mapRegisterEventToState(SignUp event) async* {
    yield RegisterLoading();
    try {
      final user = await _authService.registerWithEmailAndPassword(event.email, event.password, event.name, event.phoneNumber);
      if (user != null) {
        _authCubit.userLoggedIn(user);
        print("user : $user");
        yield RegisterSuccess();
      } else {
        yield RegisterFailure(error: 'Something very weird just happened');
      }
    } on AuthenticationException catch (e) {
      yield RegisterFailure(error: e.message);
    } catch (err) {
      yield RegisterFailure(error: err.message ?? 'An unknown error occured');
    }
  }
}
