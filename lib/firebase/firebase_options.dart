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
    apiKey: 'AIzaSyBNVcoQjfuYkWSlPsyB6Yc9QfJknaJyJIw',
    appId: '1:641260103850:web:6a0776dbd25a9cc8f008d3',
    messagingSenderId: '641260103850',
    projectId: 'e-book-d01a0',
    authDomain: 'e-book-d01a0.firebaseapp.com',
    storageBucket: 'e-book-d01a0.appspot.com',
    measurementId: 'G-C4Y2XZB2LS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaGUJ5xqsvC8aGeDOrPCE8ShCIORDmMsI',
    appId: '1:641260103850:android:2df7ec72a96a54baf008d3',
    messagingSenderId: '641260103850',
    projectId: 'e-book-d01a0',
    storageBucket: 'e-book-d01a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkzLIyOg1YUY7NLY19EeLNl26zlntl07Y',
    appId: '1:641260103850:ios:1198269b1cb2fa08f008d3',
    messagingSenderId: '641260103850',
    projectId: 'e-book-d01a0',
    storageBucket: 'e-book-d01a0.appspot.com',
    iosBundleId: 'com.example.eLibraryNamaElibMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBkzLIyOg1YUY7NLY19EeLNl26zlntl07Y',
    appId: '1:641260103850:ios:50942a17089051f1f008d3',
    messagingSenderId: '641260103850',
    projectId: 'e-book-d01a0',
    storageBucket: 'e-book-d01a0.appspot.com',
    iosBundleId: 'com.example.eLibraryNamaElibMobile.RunnerTests',
  );
}
