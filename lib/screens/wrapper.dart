import 'package:flutter/material.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return home or authenticate widget
    return Authenticate();
  }
}
