import 'package:flutter_app/blocs/cubit/auth_cubit.dart';
import 'package:flutter_app/blocs/login_bloc/login_bloc.dart';
import 'package:flutter_app/blocs/register_bloc/register_bloc.dart';
import 'package:flutter_app/data/auth_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async{
  //!Features - Places
  //Bloc
  sl.registerFactory(() => AuthCubit());
  sl.registerFactory(() => LoginBloc(sl(), sl()));
  sl.registerFactory(() => RegisterBloc(sl(),sl()));



  //Use case

  //Repository
  sl.registerLazySingleton(() => AuthenticationService());
}  