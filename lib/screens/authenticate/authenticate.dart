import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('Authentication Screen'),
          backgroundColor: Colors.brown[600],
          centerTitle: true,
        ),
        body: Text(
          'Hello screen',
          style: TextStyle(color: Colors.brown[700], fontSize: 20.0),
        ),
      ),
    );
  }
}
