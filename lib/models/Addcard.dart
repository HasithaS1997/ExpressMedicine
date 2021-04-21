// ignore: unused_import
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/screens/homepage.dart';
import 'package:loginpage/screens/login.dart';
import 'package:loginpage/services/auth.dart';
// ignore: unused_import
import 'package:loginpage/shared/loading.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class AddcardPage extends StatefulWidget {
//final Function toggleView;
//RegisterPage({this.toggleView, Void Function() toggleView});

  @override
  AddcardPageState createState() => AddcardPageState();
}

class AddcardPageState extends State<AddcardPage> {
  String cityDropdownValue = 'Anuradhapura';
   final _auth = FirebaseAuth.instance;
   
  String email;
  String password;
  bool showSpinner = false;

  // Future sendData() async {
  //   // ignore: unused_local_variable
  //   final db = Firestore.instance
  //       .collection("Userinfo")
  //       .add({'email': "hasitha@plymouth.ac.uk"});
  // }

  // ignore: unused_field
  // final AuthService _auth = AuthService();
  // final _formKey = GlobalKey<FormState>();

  // String email = "";
  // String password = "";
  // String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          color: Colors.grey,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        actions: [
          IconButton(
            color: Colors.grey,
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
            },
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      // ignore: missing_required_param
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
              child: Container(
          child: Column(
            children: [
              Container(
                child: Container(
                  margin: EdgeInsets.only(top: 5.0),
                  alignment: Alignment.topCenter,
                  child: Text(
                    'ADD CARD',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 25.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'CARD NAME',
                    hintText: 'John Doe',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: Form(
                    // key: _formKey,
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  email = value;
                                },
                              // validator: (val) =>
                              //     val.isEmpty ? 'Enter an email' : null,
                              // onChanged: (val) {
                              //   setState(() => email = val);
                              // },
                              decoration: InputDecoration(
                                  labelText: 'EXPIREDATE',
                                  hintText: 'johndoe@gmail.com',
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ))))
                    ])),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: Form(
                    // key: _formKey,
                    child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                
                                onChanged: (value) {
                                 password = value;
                                },
                          // validator: (val) =>
                          //     val.length < 6 ? 'Enter password' : null,
                          // onChanged: (val) {
                          //   setState(() => password = val);
                          // },
                          decoration: InputDecoration(
                              labelText: 'CCV',
                              hintText: '123456',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              )),
                          obscureText: true))
                ])),
              ),

              // Container(
              //     margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
              //     child: TextField(
              //       decoration: InputDecoration(
              //         labelText: 'Password',
              //         labelStyle: TextStyle(
              //           color: Colors.grey,
              //         ),
              //         focusedBorder: UnderlineInputBorder(
              //           borderSide: BorderSide(color: Colors.grey),
              //         ),
              //       ),
              //       obscureText: true,
              //     ),
              //   ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'CARD HOLDER NAME',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
             
              Container(
                margin: EdgeInsets.only(top: 50.0),
                height: 50.0,
                width: 150.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue,
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        showSpinner = true; 
                      });
                      try{
                        final newUser = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                        if(newUser != null){
                          Navigator.push(context,MaterialPageRoute(builder: (ctx)=>Homepage()));
                        }
                        setState(() {
                          showSpinner = false;
                        });

                      }catch(e){
                        print(e);
                      }
                    },
                    // onTap: () async {
                    //    if(_formKey.currentState.validate()){
                    //              dynamic result = await _auth
                    //               .registerWithEmailAndPassword(email, password);
                    //           if (result == null) {
                    //             setState(() => error = 'please enter valid email');

                    //           }
                             
                    //           }
                    // },
                    child: Center(
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(fontSize: 19.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
