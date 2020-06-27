class User {
  final String uid;

  //Constructor
  User({this.uid});
}

//userdataModel
class UserData {
  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData({this.uid, this.name, this.sugars, this.strength});
}

//brewmodel
class Brew {
  final String name;
  final String sugars;
  final int strength;

  Brew({this.name, this.sugars, this.strength});
}
