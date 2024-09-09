import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCS-3cNgGU-ws5NZZuAhUsOO-U2_6WlgY',
    appId: '1:825280165211:android:3e7e1b96b20c774f3c967e',
    messagingSenderId: '825280165211',
    projectId: 'chatapp-4545d',
    storageBucket: 'chatapp-4545d.appspot.com',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA7de491AXscqjOz5RJcPtQK6qjxUBha8g',
    appId: '1:825280165211:web:e123284273f900393c967e',
    messagingSenderId: '825280165211',
    projectId: 'chatapp-4545d',
    authDomain: 'chatapp-4545d.firebaseapp.com',
    storageBucket: 'chatapp-4545d.appspot.com',
    measurementId: 'G-SDNYK4FZ9B',
  );
}