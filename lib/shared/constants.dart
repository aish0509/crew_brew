import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:brew_crew/models/models.dart';
import 'package:provider/provider.dart';

const containerDecor = BoxDecoration(
  color: Colors.brown,
  gradient: LinearGradient(
      colors: [Color(0xffd7ccc8), Color(0xffa1887f)],
      begin: Alignment.centerRight,
      end: Alignment(-1.0, -1.0)),
);

const textInputDecor = InputDecoration(
  filled: true,
  fillColor: Colors.white24,
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xff784228), width: 2.6),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xff9c6348), width: 2.2),
  ),
);

const appBarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    bottom: Radius.elliptical(700, 100),
  ),
);

const roundButton = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(25.0),
  ),
);

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[100],
      child: SpinKitCircle(
        color: Colors.brown,
        size: 130.0,
      ),
    );
  }
}

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];
  String _currentName;
  String _currentSugar;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Container(
              decoration: containerDecor,
              height: 650.0,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 30.0),
                  child: Column(
                    children: [
                      Text(
                        'Change your Brew Preferences here',
                        style: TextStyle(
                            color: Colors.brown[700],
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        initialValue: userData.name,
                        onChanged: (val) {
                          setState(() {
                            _currentName = val;
                          });
                        },
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
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      //dropdown for sugars
                      DropdownButtonFormField(
                          decoration: textInputDecor,
                          value: _currentSugar ?? userData.sugars,
                          items: sugars.map((selected) {
                            return DropdownMenuItem(
                              child: Text('$selected Sugars'),
                              value: selected,
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _currentSugar = val;
                            });
                          }),
                      SizedBox(
                        height: 20.0,
                      ),

                      //slider for strength
                      Slider(
                        value: (_currentStrength ?? userData.strength)
                            .roundToDouble(),
                        min: 100.0,
                        max: 900.0,
                        divisions: 8,
                        activeColor:
                            Colors.brown[_currentStrength ?? userData.strength],
                        inactiveColor:
                            Colors.brown[_currentStrength ?? userData.strength],
                        label: 'Your Coffee Strength is $_currentStrength',
                        onChanged: (val) {
                          setState(() {
                            _currentStrength = val.round();
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),

                      //update button
                      RaisedButton.icon(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        color: Colors.brown[700],
                        shape: roundButton,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseService(uid: userData.uid).updateData(
                                _currentName ?? userData.name,
                                _currentSugar ?? userData.sugars,
                                _currentStrength ?? userData.strength);
                            Navigator.pop(context);
                          }
                        },
                        icon: Icon(
                          Icons.redo,
                          color: Colors.brown[100],
                        ),
                        label: Text('UPDATE',
                            style: TextStyle(
                                color: Colors.brown[100], fontSize: 18.0)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
