import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/brewmodel.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    brews.forEach((brew) {
      print(brew.name);
      print(brew.sugars);
      print(brew.strength);
    });

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
          elevation: 10.0,
          shadowColor: Colors.brown[900],
          color: Colors.brown[50],
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(15.0, 2.0, 10.0, 2.0),
            leading: CircleAvatar(
              backgroundColor: Colors.brown[brews[index].strength],
              radius: 25.0,
            ),
            title: Text(
              brews[index].name,
              style: TextStyle(
                  color: Colors.brown[800],
                  fontSize: 20.0,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              "Takes ${brews[index].sugars} sugars ",
              style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w400),
            ),
          ),
        );
      },
    );
  }
}
