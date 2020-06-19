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
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 25.0,
              ),
              TextFormField(
                cursorColor: Colors.brown[800],
                cursorWidth: 2.0,
                style: TextStyle(color: Colors.brown[800], fontSize: 20.0),
                onChanged: (value) {},
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                cursorColor: Colors.brown[800],
                cursorWidth: 2.0,
                style: TextStyle(color: Colors.brown[800], fontSize: 20.0),
                onChanged: (value) {},
                obscureText: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
