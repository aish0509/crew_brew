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
  String email;
  String pwd;
  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.brown[600],
          title: Text(
            'Sign Up to BrewCrew',
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
            child: Column(
              children: [
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Your Name',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2.0),
                    ),
                  ),
                  cursorColor: Colors.brown[800],
                  cursorWidth: 2.0,
                  style: TextStyle(color: Colors.brown[800], fontSize: 20.0),
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
                  decoration: InputDecoration(
                    hintText: 'Your E-Mail ID',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown, width: 2.0),
                    ),
                  ),
                  cursorColor: Colors.brown[800],
                  cursorWidth: 2.0,
                  style: TextStyle(color: Colors.brown[800], fontSize: 20.0),
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
                      color: Colors.brown[300],
                    ),
                    label: Text(
                      'Or Sign In...',
                      style:
                          TextStyle(color: Colors.brown[300], fontSize: 15.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(250.0),
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
                    print(email);
                    print(pwd);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
