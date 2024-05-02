import 'package:flutter/material.dart';
import 'package:song_app/constants.dart';
import 'package:song_app/helperWidgets/customButton.dart';

class IntialScreen extends StatelessWidget {
  const IntialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: backgroundinitial,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hi , I'm Soothe",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Langar',
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1F5D6B)),
              ),
              Image.asset(
                'images/photo_2024-05-02_11-24-03-removebg-preview.png',
                height: 300,
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              CustomButton(
                text: 'Get Started',
                onTap: () {
                  Navigator.pushNamed(context, 'login');
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Explore a wide range of music genres and artists.',
                style: TextStyle(fontFamily: 'Langar', fontSize: 13),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                        fontFamily: 'Langar',
                        color: Color.fromARGB(255, 136, 136, 136)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'signup');
                    },
                    child: const Text(
                      ' Sign up',
                      style: TextStyle(
                        fontFamily: 'Langar',
                        color: Color(0xff1F5D6B),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
