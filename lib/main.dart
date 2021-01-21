import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/cubit/auth_cubit.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;
import 'package:flutter_app/blocs/login_bloc/login_bloc.dart';
import 'package:flutter_app/blocs/register_bloc/register_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthCubit>(),
        ),
        BlocProvider(
          create: (_) => di.sl<RegisterBloc>(),
        ),
        BlocProvider(
          create: (_) => di.sl<LoginBloc>(),
        ),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        cubit: AuthCubit(),
        builder: (context, state) {
          return MaterialApp(
            initialRoute: state is AuthenticatedState ? "/" : "/auth_page",
            routes: {
              '/': (context) => Home(),
              "/auth_page": (context) => Register()
            },
          );
        },
      ),
    );
  }
}
