import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_final_paper/pages/signUpPage.dart';
import 'package:mad_final_paper/pages/DishAddform.dart';

import 'features/app/notification_box.dart';
import 'features/app/user_auth/firebase_auth_services.dart';

class loginPageConfiguration extends StatefulWidget {
  const loginPageConfiguration({super.key});

  @override
  State<loginPageConfiguration> createState() => _loginPageConfigurationState();
}

class _loginPageConfigurationState extends State<loginPageConfiguration> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Color appBarColor = Colors.white;
  Color email_label_color = Colors.black54;
  Color password_label_color = Colors.black54;
  var _inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0XFFF5F5F5),
            automaticallyImplyLeading: false,
            title: RichText(
                text: TextSpan(
                    text: 'Let\'s get something\n',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Color(0XFF000000),
                      fontFamily: 'Inter',
                    ),
                    children: <TextSpan>[
                  TextSpan(
                    text: 'Happy to see you back',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54),
                  )
                ]))),
        body: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollNotification) {
              if (notification.metrics.pixels > 0.0) {
                setState(() {
                  appBarColor = Colors.white;
                });
              } else {
                setState(() {
                  appBarColor = Colors.white;
                });
              }
            }
            return true;
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 35.0, right: 35.0, top: 30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      cursorColor: Colors.black,
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black54, width: 1.0),
                        ),
                        labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: email_label_color),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address.';
                        } else if (!RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address.';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {
                          email_label_color = Colors.black54;
                        });
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      cursorColor: Colors.black,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black54, width: 1.0),
                        ),
                        labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: password_label_color),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password.';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long.';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {
                          _inputText = text;
                          password_label_color = Colors.black54;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Forgot Pascode?',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFF5733),
                          fontFamily: 'Inter'),
                    ),
                    SizedBox(height: 345.0),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFF5733),
                          minimumSize: Size(265, 55),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _signIn();
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      (signUpPageConfiguration())));
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Didn\'t have an account?',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                              fontFamily: 'Inter',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFFF5733)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _auth.signInWithEmailAndPassword(email, password);
    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DishAddForm()));
      messageToShow('User is successfully LoggedIn!');
    } else {
      messageToShow('Something Went Wrong!');
    }
  }
}
