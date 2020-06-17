import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        title: Text('Sign In to BrewCrew'),
        centerTitle: true,
        elevation: 0.7,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: RaisedButton(
            child: Text('Sign in Anonymously'),
            onPressed: () async {
              dynamic result = await _authService.anonSignIn();
              if (result == null) {
                print("error signing in");
              } else {
                print("signed in successfully");
                print(result.uid);
              }
            }),
      ),
    );
  }
}
