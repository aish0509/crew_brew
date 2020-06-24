import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  Future updateData(String name, String sugars, int strength) async {
    return await brewCollection
        .document(uid)
        .setData({'name': name, 'sugars': sugars, 'strength': strength});
  }
}
