import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/blocs/register_bloc/register_bloc.dart';
import 'package:flutter_app/formval.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  FormVal input = FormVal();

  var _firstNameController = new TextEditingController();
  var _lastNameController = new TextEditingController();
  var _phoneNumberController = new TextEditingController();
  var _emailController = new TextEditingController();
  var _passwordController = TextEditingController();

  void formState() {
    final FormState finalFormState = formKey.currentState;
    if (finalFormState.validate()) {
      finalFormState.save();
      print("${input.phoneNumber}");
      print("${input.firstName}  ${input.lastName}");
      BlocProvider.of<RegisterBloc>(context).add(SignUp(
          phoneNumber: _phoneNumberController.text,
          name: _firstNameController.text +" "+ _lastNameController.text,
          email: _emailController.text,
          password: _passwordController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(

      builder: (context, state) {
      if (state is RegisterLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      return Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          decoration: BoxDecoration(
              image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.saturation),
            image: AssetImage("assets/Background.jpg"),
            fit: BoxFit.cover,
          )),
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                BackdropFilter(
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.1)),
                    ),
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 2)),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.pink[100],
                                  fontSize: 45,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'please enter your number' : null,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pink),
                                  borderRadius: BorderRadius.circular(20.0)),
                              fillColor: Colors.grey[500].withOpacity(0.7),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.pink,
                                size: 35,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              hintText: "Enter your mobile number",
                              prefixText: "+234  ",
                              prefixStyle: TextStyle(fontSize: 20.0)),
                          maxLength: 10,
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.number,
                          onChanged: (val) {
                            setState(() => input.phoneNumber = val);
                          },
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'please enter your number' : null,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pink),
                                  borderRadius: BorderRadius.circular(20.0)),
                              fillColor: Colors.grey[500].withOpacity(0.7),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.pink,
                                size: 35,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 3.0),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              hintText: "Enter your First name",
                              prefixStyle: TextStyle(fontSize: 20.0)),
                          maxLength: 10,
                          keyboardType: TextInputType.text,
                          controller: _firstNameController,
                          onChanged: (val) {
                            setState(() => input.firstName = val);
                          },
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          validator: (val) => val.isEmpty
                              ? 'please enter your last name'
                              : null,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pink),
                                  borderRadius: BorderRadius.circular(20.0)),
                              fillColor: Colors.grey[500].withOpacity(0.5),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.pink,
                                size: 35,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 3.0),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              hintText: "Enter your last name",
                              prefixStyle: TextStyle(fontSize: 20.0)),
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          controller: _lastNameController,
                          onChanged: (val) {
                            setState(() => input.lastName = val);
                          },
                        ),
                      ),
                      Container(
                        child: TextFormField(obscureText: true,
                          validator: (val) =>
                              val.isEmpty ? 'please enter your password' : null,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pink),
                                  borderRadius: BorderRadius.circular(20.0)),
                              fillColor: Colors.grey[500].withOpacity(0.7),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.visibility_off,
                                color: Colors.pink,
                                size: 35,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 3.0),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              hintText: "Enter your Password",
                              prefixStyle: TextStyle(fontSize: 20.0)),
                          maxLength: 10,
                          keyboardType: TextInputType.text,
                          controller: _passwordController,
                          
                        ),
                      ),
                      RaisedButton(
                          elevation: 50,
                          color: Colors.pink[200],
                          onPressed: () {
                            formState();
                          },
                          child: Text("Register"))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
