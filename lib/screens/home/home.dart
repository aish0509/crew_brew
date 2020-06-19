import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authS = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[700],
          title: Text(
            'Home Screen',
            style: TextStyle(color: Colors.brown[50]),
          ),
          actions: [
            FlatButton.icon(
                onPressed: () async {
                  await _authS.signOut();
                },
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.brown[100],
                ),
                label: Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.brown[50], fontSize: 16.0),
                ))
          ],
        ),
        body: Column(
          children: [
            Text(
              'This is home screen',
              style: TextStyle(color: Colors.brown[800]),
            ),
          ],
        ),
      ),
    );
  }
}
