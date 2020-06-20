import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _authService = AuthService();
  String email = '';
  String pwd = '';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.brown[600],
          title: Text(
            'Sign In to BrewCrew',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(700, 100),
            ),
          ),
          centerTitle: true,
          elevation: 0.7,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Your E-Mail ID',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2.0),
                    ),
                  ),
                  cursorColor: Colors.brown[800],
                  cursorWidth: 2.0,
                  style: TextStyle(color: Colors.brown[800], fontSize: 20.0),
                  validator: (value) {
                    if ((value.contains('@') != true) ||
                        (value.isEmpty == true)) {
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
                  decoration: InputDecoration(
                    hintText: 'Your Password',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2.0),
                    ),
                  ),
                  cursorColor: Colors.brown[800],
                  cursorWidth: 2.0,
                  style: TextStyle(color: Colors.brown[800], fontSize: 20.0),
                  obscureText: true,
                  validator: (value) {
                    if (value.length < 6) {
                      return 'Please enter a valid password';
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
                      //referring to the SignIn widget created.
                      widget.toggleView();
                    },
                    icon: Icon(
                      Icons.person_pin,
                      color: Colors.brown[300],
                    ),
                    label: Text(
                      'Or Sign Up...',
                      style:
                          TextStyle(color: Colors.brown[300], fontSize: 15.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 35.1),
                  child: Text(
                    'GO ON...',
                    style: TextStyle(color: Colors.brown[50], fontSize: 17.0),
                  ),
                  color: Colors.brown[500],
                  onPressed: () async {
                    if (_formkey.currentState.validate() == true) {
                      print(email);
                      print(pwd);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
