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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDM2ZrLHifCr-o7pbfa2ApXZOtLu_7chwI',
    appId: '1:1034453032226:web:1857657250cb278ee9197b',
    messagingSenderId: '1034453032226',
    projectId: 'banco-amigo-5d2aa',
    authDomain: 'banco-amigo-5d2aa.firebaseapp.com',
    storageBucket: 'banco-amigo-5d2aa.appspot.com',
    measurementId: 'G-6EE4GDCHS8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCja0PoZv4NWYCEbX9-T689nEzdn2bhcvk',
    appId: '1:1034453032226:android:79bd9b996af7f614e9197b',
    messagingSenderId: '1034453032226',
    projectId: 'banco-amigo-5d2aa',
    storageBucket: 'banco-amigo-5d2aa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgvwqBFaoZ2n5dI2U33q2M8-0IiPJD8T0',
    appId: '1:1034453032226:ios:7c8332eded28e9f2e9197b',
    messagingSenderId: '1034453032226',
    projectId: 'banco-amigo-5d2aa',
    storageBucket: 'banco-amigo-5d2aa.appspot.com',
    iosClientId: '1034453032226-q7rq2v5ouvjgahfn0t5rmgrs8gssrigb.apps.googleusercontent.com',
    iosBundleId: 'com.example.bancoAmigo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgvwqBFaoZ2n5dI2U33q2M8-0IiPJD8T0',
    appId: '1:1034453032226:ios:7c8332eded28e9f2e9197b',
    messagingSenderId: '1034453032226',
    projectId: 'banco-amigo-5d2aa',
    storageBucket: 'banco-amigo-5d2aa.appspot.com',
    iosClientId: '1034453032226-q7rq2v5ouvjgahfn0t5rmgrs8gssrigb.apps.googleusercontent.com',
    iosBundleId: 'com.example.bancoAmigo',
  );
}