import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthService _authS = AuthService();
  String email = '';
  String pwd = '';
  String name = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: AppBar(
                backgroundColor: Colors.brown[800],
                title: Text(
                  'Sign Up to BrewCrew',
                ),
                shape: appBarShape,
                centerTitle: true,
                elevation: 0.7,
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        decoration:
                            textInputDecor.copyWith(hintText: 'Your Name'),
                        cursorColor: Colors.brown[800],
                        cursorWidth: 2.0,
                        style:
                            TextStyle(color: Colors.brown[800], fontSize: 20.0),
                        validator: (value) {
                          if (value.isEmpty == true) {
                            return 'Please enter your name';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration:
                            textInputDecor.copyWith(hintText: 'Your E-mail ID'),
                        cursorColor: Colors.brown[800],
                        cursorWidth: 2.0,
                        style:
                            TextStyle(color: Colors.brown[800], fontSize: 20.0),
                        validator: (String value) {
                          if (value.contains('@') != true) {
                            return 'Please enter a valid E-Mail';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration:
                            textInputDecor.copyWith(hintText: 'Your Password'),
                        cursorColor: Colors.brown[800],
                        cursorWidth: 2.0,
                        style:
                            TextStyle(color: Colors.brown[800], fontSize: 20.0),
                        obscureText: true,
                        validator: (value) {
                          if (value.length < 6) {
                            return 'Please enter a valid password with more than 6 characters';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            pwd = value;
                          });
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton.icon(
                          onPressed: () {
                            widget.toggleView();
                          },
                          icon: Icon(
                            Icons.person_pin,
                            color: Colors.brown[400],
                          ),
                          label: Text(
                            'Or Sign In...',
                            style: TextStyle(
                                color: Colors.brown[400], fontSize: 16.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      FlatButton(
                        shape: roundButton,
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 35.1),
                        child: Text(
                          'GO ON...',
                          style: TextStyle(
                              color: Colors.brown[50], fontSize: 17.0),
                        ),
                        color: Colors.brown[700],
                        onPressed: () async {
                          if (_formKey.currentState.validate() == true) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result =
                                await _authS.registerWithEmailPwd(email, pwd);

                            if (result == null) {
                              setState(() {
                                error = "Please Supply a valid E-mail";
                                loading = false;
                              });
                            }
                          }
                        },
                      ),
                      SizedBox(
                          height: 30.0,
                          child: Text(
                            error,
                            style: TextStyle(color: Colors.red),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
