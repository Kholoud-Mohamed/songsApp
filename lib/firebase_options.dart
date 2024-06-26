// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyA8Kz3Ia6OaN0fXd3Tae6WoB-ZvnyxsZxM',
    appId: '1:80073109:web:9921f268d74acd4444a69c',
    messagingSenderId: '80073109',
    projectId: 'song-25f37',
    authDomain: 'song-25f37.firebaseapp.com',
    storageBucket: 'song-25f37.appspot.com',
    measurementId: 'G-0SP029EB2S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-Z-RqN-HrbjurH_5Azv_SgC8gVIykQA4',
    appId: '1:80073109:android:537d8cd77951b31b44a69c',
    messagingSenderId: '80073109',
    projectId: 'song-25f37',
    storageBucket: 'song-25f37.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlaGN-gwEXSXT9l8QAVVFAoOR1kX8IeBU',
    appId: '1:80073109:ios:118b52c65bde390844a69c',
    messagingSenderId: '80073109',
    projectId: 'song-25f37',
    storageBucket: 'song-25f37.appspot.com',
    iosBundleId: 'com.example.songApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlaGN-gwEXSXT9l8QAVVFAoOR1kX8IeBU',
    appId: '1:80073109:ios:118b52c65bde390844a69c',
    messagingSenderId: '80073109',
    projectId: 'song-25f37',
    storageBucket: 'song-25f37.appspot.com',
    iosBundleId: 'com.example.songApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA8Kz3Ia6OaN0fXd3Tae6WoB-ZvnyxsZxM',
    appId: '1:80073109:web:6fcd287ea40a424444a69c',
    messagingSenderId: '80073109',
    projectId: 'song-25f37',
    authDomain: 'song-25f37.firebaseapp.com',
    storageBucket: 'song-25f37.appspot.com',
    measurementId: 'G-G38BW7JT1K',
  );
}
