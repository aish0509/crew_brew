import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      color: Colors.brown[200],
      child: SpinKitCircle(
        color: Colors.brown,
        size: 130.0,
      ),
    );
  }
}
