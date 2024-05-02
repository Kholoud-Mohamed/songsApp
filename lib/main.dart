import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:song_app/Screens/intialScreen.dart';
import 'package:song_app/Screens/loginScreen.dart';
import 'package:song_app/Screens/musicScreen.dart';
import 'package:song_app/Screens/music_list.dart';
import 'package:song_app/Screens/signupScreen.dart';
import 'package:song_app/helperWidgets/models/music.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Music> playlist = [
    Music(trackId: '7MXVkk9YMctZqd1Srtv4MB'), // Add more songs here
    Music(trackId: '3WOiSsqfXPZAtGTr2PFj6S'),
    Music(trackId: '11dFghVXANMlKmJXsNCbNl'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'initial': (context) => const IntialScreen(),
        'login': (context) => const LogInScreen(),
        'signup': (context) => const SignUpScreen(),
        'music': (context) => MyHomePage(playlist: playlist),
      },
      initialRoute: 'initial',
    );
  }
}
