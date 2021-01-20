part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class SignUp extends RegisterEvent {
  final String email;
  final String password;
  final String phoneNumber;
  final String name;
  SignUp({@required this.email, @required this.password, @required this.phoneNumber,  @required this.name});
  @override
  List<Object> get props => [name, phoneNumber, email, password];
}
 


