import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[700],
          title: Text('Home Screen'),
          centerTitle: true,
        ),
        body: Text(
          'This is home screen',
          style: TextStyle(color: Colors.brown[800]),
        ),
      ),
    );
  }
}
