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
    apiKey: 'AIzaSyAD7brVgCot23oXRVm72e4KMkG6shNb0Ss',
    appId: '1:197923742026:web:ee0181b08a2a71f127a1b3',
    messagingSenderId: '197923742026',
    projectId: 'capstone-4cfb3',
    authDomain: 'capstone-4cfb3.firebaseapp.com',
    storageBucket: 'capstone-4cfb3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGV4INQZiKaEdJRMmkwZWd8xqqvjSjYP0',
    appId: '1:197923742026:android:6521cf0e5533eb9727a1b3',
    messagingSenderId: '197923742026',
    projectId: 'capstone-4cfb3',
    storageBucket: 'capstone-4cfb3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTP5pSKmgHANEkEBTHnytPABXxcs3avc8',
    appId: '1:197923742026:ios:7e1e8145d250e33827a1b3',
    messagingSenderId: '197923742026',
    projectId: 'capstone-4cfb3',
    storageBucket: 'capstone-4cfb3.appspot.com',
    iosClientId: '197923742026-kv64home1qc8mahr6i6rs2c3ia6600m8.apps.googleusercontent.com',
    iosBundleId: 'com.example.capstone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTP5pSKmgHANEkEBTHnytPABXxcs3avc8',
    appId: '1:197923742026:ios:7e1e8145d250e33827a1b3',
    messagingSenderId: '197923742026',
    projectId: 'capstone-4cfb3',
    storageBucket: 'capstone-4cfb3.appspot.com',
    iosClientId: '197923742026-kv64home1qc8mahr6i6rs2c3ia6600m8.apps.googleusercontent.com',
    iosBundleId: 'com.example.capstone',
  );
}
