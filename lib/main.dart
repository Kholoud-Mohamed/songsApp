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
    Music(trackId: '7MXVkk9YMctZqd1Srtv4MB'),
    Music(trackId: '3WOiSsqfXPZAtGTr2PFj6S'),
    Music(trackId: '11dFghVXANMlKmJXsNCbNl'),
    Music(trackId: '2vknxlulbj1JApedTlmrZv'),
    Music(trackId: '6GkrhEQYOpCurp8gJWz91H'),
    Music(trackId: '4HXRJ3Bz49FEDeEOfdtUJO'),
    Music(trackId: '5LtHZB7vU02HtNoOzNcVhc'),
    Music(trackId: '5rCq30EbJ3DfZPKybGZj8F'),
    Music(trackId: '7qLXBcYW78is9LygQBziAU'),
    Music(trackId: '0ECT1q8mtxBE7cCRIeCXO2'),
    Music(trackId: '1ZuHXbFUhAb3SHOn4TzQbW'),
    Music(trackId: '00TO3hVgOAgfKrRjrKEZxx'),
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
