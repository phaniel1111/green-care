import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:greencare/models/user_info.dart';

final _firebaseDB = FirebaseDatabase.instance.ref();

void writeUserData(User user) async{

  UserInformation newUser = UserInformation(
    uid: user.uid,
    name: user.displayName != null ? user.displayName! : '',
    email: user.email != null ? user.email! : '',
    imageURL: user.photoURL != null ? user.photoURL! : '',
    isPremium: false,
  );
  DatabaseReference userRef = _firebaseDB.child('users/${newUser.uid}');
  userRef.set(newUser.toJson());
}

Future<UserInformation> readUserData(String uid) async {
  DataSnapshot snapshot = await _firebaseDB.child('users/$uid').get();
  if (snapshot.exists) {
    var userData = snapshot.value!;
    String jsonString = json.encode(userData);
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    UserInformation user = UserInformation.fromJson(jsonMap);
    return user;
  } else {
    throw Exception('User data not found');
  }
}