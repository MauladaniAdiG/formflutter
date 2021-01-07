import 'package:app/homepage.dart';
import 'package:app/util/navigator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool isEmailValid(String value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Login',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => isEmailValid(value)
                            ? null
                            : 'Silahkan isi email\nSebelum @ tidak boleh ada karakter titik',
                        decoration: InputDecoration(
                            hintText: 'email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintStyle: TextStyle(fontSize: 12)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _password,
                        obscureText: true,
                        validator: (value) =>
                            value.isEmpty ? 'Silahkan isi password' : null,
                        decoration: InputDecoration(
                            hintText: 'password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintStyle: TextStyle(fontSize: 12)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 200,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.blue[200],
                          onPressed: () {
                            if (_key.currentState.validate()) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homepage()),
                                  (Route<dynamic> route) => false);
                            }
                          },
                          child: Text('Login'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
