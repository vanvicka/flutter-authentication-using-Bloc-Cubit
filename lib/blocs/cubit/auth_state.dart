part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthenticatedState extends AuthState {
   final FirebaseUser user;
  AuthenticatedState({@required this.user});
  @override
  List<Object> get props => [user];
}

class UnauthenticatedState extends AuthState {}