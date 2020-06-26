import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/brewmodel.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/screens/home/brew_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authS = AuthService();

  @override
  Widget build(BuildContext context) {
    void showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return SettingsForm();
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: AppBar(
            shape: appBarShape,
            leading: Icon(
              Icons.whatshot,
              size: 55.0,
              color: Colors.brown[300],
            ),
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
                ),
              ),
              FlatButton.icon(
                onPressed: () {
                  showSettingsPanel();
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.brown[100],
                ),
                label: Text('Settings'),
              )
            ],
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg.png'), fit: BoxFit.cover)),
            child: BrewList()),
      ),
    );
  }
}
