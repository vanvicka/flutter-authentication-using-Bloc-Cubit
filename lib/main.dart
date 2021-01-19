
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/sign_up.dart';


void main() => runApp(MaterialApp(
  initialRoute: "/login_page",
  routes: {'/home': (context)=> Home(),
    "/login_page":(context) => Register()
  },
));




