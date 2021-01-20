import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/blocs/cubit/data/auth_service.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final _authService = AuthenticationService();

  Future<void> userLoggedIn(FirebaseUser user) async {
    emit(AuthenticatedState(user: user));
  }

  Future<void> userLoggedOut() async {
    await _authService.logOut();
    emit(UnauthenticatedState());
  }
}
