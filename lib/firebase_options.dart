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
    apiKey: 'AIzaSyBjYrbK7FMUrvdyQJslTP12Qsd4cQbaon4',
    appId: '1:665137652680:web:47f7048842eb866ec796fd',
    messagingSenderId: '665137652680',
    projectId: 'chaapp-3e0fa',
    authDomain: 'chaapp-3e0fa.firebaseapp.com',
    storageBucket: 'chaapp-3e0fa.appspot.com',
    measurementId: 'G-JCRV3K6PFX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDl6dof1yAq32mkZkzgLlNOgptFCK71DAQ',
    appId: '1:665137652680:android:41818a9e648555c4c796fd',
    messagingSenderId: '665137652680',
    projectId: 'chaapp-3e0fa',
    storageBucket: 'chaapp-3e0fa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYCx2cfIoqp0MH9ZmIqPuHMbzfe11Y83A',
    appId: '1:665137652680:ios:e02123b2742d341ac796fd',
    messagingSenderId: '665137652680',
    projectId: 'chaapp-3e0fa',
    storageBucket: 'chaapp-3e0fa.appspot.com',
    iosClientId: '665137652680-l9nm859s1ihjc7picrfoohef8dtapjn1.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatAppUsingFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYCx2cfIoqp0MH9ZmIqPuHMbzfe11Y83A',
    appId: '1:665137652680:ios:a1432d9d2ebe7e2fc796fd',
    messagingSenderId: '665137652680',
    projectId: 'chaapp-3e0fa',
    storageBucket: 'chaapp-3e0fa.appspot.com',
    iosClientId: '665137652680-1h2o6734hv1bo6tceifaaon4demmf0so.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatAppUsingFirebase.RunnerTests',
  );
}