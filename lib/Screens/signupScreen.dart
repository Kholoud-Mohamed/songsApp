import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:song_app/Screens/music_list.dart';
import 'package:song_app/constants.dart';
import 'package:song_app/helperWidgets/customButton.dart';
import 'package:song_app/helperWidgets/customTextField.dart';
import 'package:song_app/helperWidgets/models/music.dart';
import 'package:song_app/helperWidgets/passwordfield.dart';
import 'package:song_app/helperWidgets/show_snack_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  String? _confirmPasswordError;
  List<Music> playlist = [
    Music(trackId: '044wYqqUEQ9toXSaDOeMMu'), // Surah Al-Baqarah
    Music(trackId: '1PxMbYJwmkjddv28o51e5C'), // Surah Yasin
    Music(trackId: '7MXVkk9YMctZqd1Srtv4MB'),
    Music(trackId: '3WOiSsqfXPZAtGTr2PFj6S'),
    Music(trackId: '11dFghVXANMlKmJXsNCbNl'),
    Music(trackId: '2vknxlulbj1JApedTlmrZv'),
    Music(trackId: '6GkrhEQYOpCurp8gJWz91H'),
    Music(trackId: '4HXRJ3Bz49FEDeEOfdtUJO'),
    Music(trackId: '4Guq7XrO1FjduwFBsVbr0E'),
    Music(trackId: '2Heqj9jtxarmecKxycGSWn'),
    Music(trackId: '7qLXBcYW78is9LygQBziAU'),
    Music(trackId: '0ECT1q8mtxBE7cCRIeCXO2'),
    Music(trackId: '1ZuHXbFUhAb3SHOn4TzQbW'),
    Music(trackId: '00TO3hVgOAgfKrRjrKEZxx'),
  ];

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 30),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          height: double.infinity,
          width: double.infinity,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 10),
                Container(
                  // height: 590,
                  width: 100,
                  decoration: BoxDecoration(
                    color: loginCard,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 205, top: 20),
                              child: Text(
                                'Welcome!',
                                style: TextStyle(
                                  fontFamily: 'Langar',
                                  fontSize: 24,
                                  color: grayText,
                                ),
                              ),
                            ),
                            Text(
                              'Create Your Account ',
                              style: TextStyle(
                                fontFamily: 'Langar',
                                fontSize: 25,
                                color: grayText,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        CustomFormTextField(
                          onChanged: (data) {
                            name = data;
                          },
                          hintText: 'Full Name',
                        ),
                        const SizedBox(height: 20),
                        CustomFormTextField(
                          onChanged: (data) {
                            email = data;
                          },
                          hintText: 'Email',
                          validator: (data) {
                            if (data!.isEmpty) {
                              return 'Field is required';
                            }

                            if (!isEmailValid(data)) {
                              return 'Invalid email address';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        PasswordField(
                          onChanged: (data) {
                            password = data;
                          },
                          hintText: 'Password',
                          minLength: 6,
                          onValidate: (data) {
                            if (data == null || data.isEmpty) {
                              return 'Field is required';
                            }

                            // Add your custom password validation rules here
                            if (data.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            if (!data.contains(RegExp(r'[A-Z]'))) {
                              return 'Password must contain at least one uppercase letter';
                            }
                            if (!data.contains(RegExp(r'[a-z]'))) {
                              return 'Password must contain at least one lowercase letter';
                            }
                            if (!data.contains(RegExp(r'[0-9]'))) {
                              return 'Password must contain at least one digit';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        PasswordField(
                          onChanged: (data) {
                            confirmPassword = data;
                          },
                          hintText: 'Confirm Password',
                          onValidate: (data) {
                            if (password != null &&
                                confirmPassword != null &&
                                password != confirmPassword) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isLoading =
                                    true; // Set loading to true before starting signup process
                              });
                              try {
                                await registerUser();
                              } on FirebaseAuthException catch (ex) {
                                if (ex.code == 'weak-password') {
                                  showSnackBar(context, 'Weak password');
                                } else if (ex.code == 'email-already-in-use') {
                                  showSnackBar(context, 'Email already exists');
                                }
                              } catch (ex) {
                                // showSnackBar(context, 'There was an error');
                              } finally {
                                // Reset isLoading flag after signup process is completed
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            } else {
                              if (password != null &&
                                  confirmPassword != null &&
                                  password != confirmPassword) {
                                setState(() {
                                  _confirmPasswordError =
                                      'Passwords do not match';
                                });
                              } else {
                                setState(() {
                                  _confirmPasswordError = null;
                                });
                              }
                            }
                          },
                          text: 'SIGN UP',
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'already have an account?',
                              style: TextStyle(
                                  fontFamily: 'Langar',
                                  color: Color.fromARGB(255, 136, 136, 136)),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                '  Login',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'email': email,
      });
      setState(() {
        isLoading = false;
      });

      // If user registration is successful without any exceptions, navigate to the MusicList screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(playlist: playlist)),
      );
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        showSnackBar(context, 'Weak password');
      } else if (ex.code == 'email-already-in-use') {
        showSnackBar(context, 'email-already-in-use');
      } else {
        showSnackBar(context, 'Error: ${ex.message}');
      }
    } catch (ex) {
      showSnackBar(context, 'Error: $ex');
    } finally {
      // Reset isLoading flag after navigation is completed
      setState(() {
        isLoading = false;
      });
    }
  }

  bool isEmailValid(String email) {
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegex.hasMatch(email);
  }
}
