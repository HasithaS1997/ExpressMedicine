//import 'dart:html';
// ignore: unused_import
//import 'dart:wasm';

import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:loginpage/authenticate/user.dart';
import 'package:loginpage/models/Addcard.dart';
import 'package:loginpage/screens/background.dart';
import 'package:loginpage/screens/homepage.dart';
import 'package:loginpage/screens/registerpage.dart';
import 'package:loginpage/services/auth.dart';
import 'package:loginpage/shared/loading.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;
// ignore: unused_import
//import '.';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';

enum LoginFormType { login, register }

class Login extends StatefulWidget {
 
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
 
  // final AuthService _auth = AuthService();
  // final _formKey = GlobalKey<FormState>();
  final LocalStorage storage = new LocalStorage('MEDICINEAPP');
  String email;
  String password;

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Express Medicine'),
        ),
        resizeToAvoidBottomInset: false,
        // ignore: missing_required_param
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Background(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/medicine.png'))),
                  ),
                  Container(
                    child: Form(
                          
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                  
                          child: TextField(
                            // controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email = value;
                            },

                            decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(Icons.account_circle),
                              labelStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade400),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextFormField(
                              obscureText: true,
                              onChanged: (value) {
                                password = value;
                              },
                              // controller: _passwordController,
                              //  validator: (val) => val.length < 6
                              //   ? 'Enter an 6 character password'
                              //   : null,
                              // onChanged: (val) {
                              //   setState(() => password = val);
                              // },
                              decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(Icons.lock),
                                labelStyle: TextStyle(
                                    fontSize: 14, color: Colors.grey.shade400),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )),
                              )),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                                fontSize: 15, color: Color(0XFF2661FA)),
                          ),
                        ),
                      ],
                    )),
                  ),
                  RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        // print(email);
                        // print(password);
                        try {
                          var url =
                              // passing 2 parameters first one as the base URL and other one as the
                              Uri.https("expressmedicine.tk", "/api/v1/login");
                          var res = await http.post(
                            url,
                            headers: <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8',
                              'Accept': 'application/json; charset=UTF-8',
                            },
                            body: jsonEncode(<String, String>{
                              'mobile': email,
                              'password': password,
                            }),
                          );

                          if (res.statusCode == 200) {
                            var jsonResponse = convert.jsonDecode(res.body);
                            print(jsonResponse);
                            storage.setItem('token', jsonResponse.token);
                            storage.setItem('user', jsonResponse.user);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage()));
                          } else {
                            var jsonResponse = convert.jsonDecode(res.body);
                            print(jsonResponse);
                            AlertDialog(title: Text("Sample Alert Dialog"));
                          }
                        } catch (e) {
                          print(e);

                          AlertDialog(title: Text(" Error " + e));
                        }
                      }),
                  SizedBox(height: 12.0),
                  Container(
                      alignment: Alignment.bottomRight,
                      margin:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => RegisterPage()))
                        },
                        child: Text(
                          "Dont Have an Account? Sign Up",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2661FA)),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
