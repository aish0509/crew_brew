import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    if (user != null) {
      return User(uid: user.uid);
    } else {
      return null;
    }
  }

  //look for auth cahnges using Firebase Streams
  Stream<User> get user {
    // return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFirebaseUser(user));
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in anonymously
  Future anonSignIn() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with username password
  Future signInWithUsernamePwd(String email, String pwd) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with username password
  Future registerWithEmailPwd(String email, String pwd) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pwd);
      FirebaseUser user = result.user;

      //setting userData when new registration
      await DatabaseService(uid: user.uid)
          .updateData('New BrewCrew Member', '0', 100);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
