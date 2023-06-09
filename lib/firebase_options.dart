// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjB94E00UHtiPhgakpQ-tyDLKgilZtyVw',
    appId: '1:976253506213:android:69eb971ed6d0c4026bb34c',
    messagingSenderId: '976253506213',
    projectId: 'greencare-db041',
    databaseURL: 'https://greencare-db041-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'greencare-db041.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA297n3gMJQgtk90N1wvmSy3NLR_51ln0o',
    appId: '1:976253506213:ios:8876a7514ee3565e6bb34c',
    messagingSenderId: '976253506213',
    projectId: 'greencare-db041',
    databaseURL: 'https://greencare-db041-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'greencare-db041.appspot.com',
    androidClientId: '976253506213-juaf9l6ojlrufdu63ugadv77rq4gfu3j.apps.googleusercontent.com',
    iosClientId: '976253506213-kr3tieet29ebiv2q8jhc1k3tf0tv2v9k.apps.googleusercontent.com',
    iosBundleId: 'com.example.greencare',
  );
}
