import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:greencare/utilities/firebase/user_info.dart';

final _firebaseAuth = FirebaseAuth.instance;

Future<void> googleSignIn() async{
  try{
    final googleUser = await GoogleSignIn().signIn();
    // Handle successful sign-in
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    if (userCredential.additionalUserInfo!.isNewUser) {
      writeUserData(userCredential.user!);
    }
  } catch (err) {
    rethrow;
  }
}