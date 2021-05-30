// ignore: unused_import
import 'dart:ffi';
import 'dart:convert';
import 'package:localstorage/localstorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/main.dart';
import 'package:loginpage/models/Addcard.dart';
import 'package:loginpage/screens/homepage.dart';
import 'package:loginpage/screens/login.dart';
import 'package:loginpage/shared/loading.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RegisterPage extends StatefulWidget {
//final Function toggleView;
//RegisterPage({this.toggleView, Void Function() toggleView});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //  FirebaseUser loggedInUser;
  //  String nametext,emailtext,passwordtext,confirmpasswordtext,addresstext,citytext;
  //  int contactnumber;
  String name;
  String mobile;
  String password;
  String address;
  String age;
 
 
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
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
                    'REGISTRATION',
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
                  //keyboardType: TextInputType.name,
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
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
                        //  keyboardType: TextInputType,
                          onChanged: (value) {
                            mobile= value;
                          },
                          // validator: (val) =>
                          //     val.length < 6 ? 'Enter password' : null,
                          // onChanged: (val) {
                          //   setState(() => password = val);
                          // },
                          decoration: InputDecoration(
                              labelText: 'Mobile',
                              hintText: '+94 71xxxxxxx',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              )),
                          obscureText: false))
                ])),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: TextField(
                  //keyboardType: TextInputType.name,
                  onChanged: (value) {
                  password = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
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
                margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                child: Form(
                    // key: _formKey,
                    child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                           address = value;
                          },
                          // validator: (val) =>
                          //     val.length < 6 ? 'Enter password' : null,
                          // onChanged: (val) {
                          //   setState(() => password = val);
                          // },
                          decoration: InputDecoration(
                              labelText: 'Address',
                              hintText: '',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              )),
                          obscureText: false))
                ])),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
                  child: TextField(
                    //   keyboardType: TextInputType.name,
                    onChanged: (value){
                      age = value;
                   },
                    decoration: InputDecoration(
                      labelText: 'Age',
                      hintText: '',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
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
                      // print({name});
                      // print({mobile});
                      // print({address});
                      // print({password});
                      try {
                        var url = Uri.https(
                            "expressmedicine.tk", "/api/v1/create-user");
                        var res = await http.post(url,
                            headers: <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8',
                              'Accept': 'application/json; charset=UTF-8',
                            },
                            body: jsonEncode(<String, String>{
                              'name': name,
                              'mobile': mobile,
                              'password': password,
                              'address':address,
                              'age': age,
                            }),
                            );
                            if(res.statusCode == 200){
                              var jsonResponse = convert.jsonDecode(res.body);
                              print(jsonResponse);
                              Navigator.push(context,MaterialPageRoute(builder: (ctx)=>Login()));
                            }else{
                              var jsonResponse = convert.jsonDecode(res.body);
                              print(jsonResponse);
                              AlertDialog(title: Text(""));
                            }
                      } catch (e) {
                        print(e);

                      }
                    },
                    child: Center(
                      child: Text(
                        'REGISTER',
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


































// // ignore: unused_import
// import 'dart:convert';
// import 'dart:ffi';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

// // import 'package:covidapp/main.dart';
// // import 'package:covidapp/login.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:loginpage/screens/login.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

// class RegisterPage extends StatefulWidget {
// //final Function toggleView;
// //RegisterPage({this.toggleView, Void Function() toggleView});

//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//  String cityDropdownValue = 'Anuradhapura';
//  String nic;
//  String name;
//  String age;
//  String profession;
//  String email;
//  String password;
//  String affiliation;
//  String mobile;
//  bool showSpinner = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.greenAccent,
//         elevation: 0.0,
//         leading: IconButton(
//           color: Colors.grey,
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pushNamed(context, '/');
//           },
//         ),
//         actions: [
//           IconButton(
//             color: Colors.grey,
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => Login()));
//             },
//           ),
//         ],
//       ),
//       resizeToAvoidBottomInset: false,
//       body: ModalProgressHUD(
//         inAsyncCall: showSpinner,
//         child: Container(
//           child: Column(
//             children: [
//               Container(
//                 child: Container(
//                   margin: EdgeInsets.only(top: 5.0),
//                   alignment: Alignment.topCenter,
//                   child: Text(
//                     'REGISTRATION',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green,
//                         fontSize: 25.0),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.fromLTRB(30.0, 3.0, 30.0, 0.0),
//                 child: TextField(
//                   keyboardType: TextInputType.name,
//                   onChanged: (value) {
//                     value = nic;
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'NIC',
//                     hintText: 'John Doe',
//                     labelStyle: TextStyle(
//                       color: Colors.grey,
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.fromLTRB(30.0, 3.0, 30.0, 0.0),
//                 child: Form(
//                     // key: _formKey,
//                     child: Column(children: [
//                   Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: TextFormField(
//                           keyboardType: TextInputType.emailAddress,
//                           onChanged: (value) {
//                             value = name;
//                           },
//                           decoration: InputDecoration(
//                               labelText: 'NAME',
//                               hintText: '',
//                               labelStyle: TextStyle(
//                                 color: Colors.grey,
//                               ),
//                               focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.grey),
//                               ))))
//                 ])),
//               ),
//               Container(
//                 margin: EdgeInsets.fromLTRB(30.0, 3.0, 30.0, 0.0),
//                 child: Form(
//                     child: Column(children: [
//                   Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: TextFormField(
//                           keyboardType: TextInputType.emailAddress,
//                           onChanged: (value) {
//                             value = age;
//                           },
//                           decoration: InputDecoration(
//                               labelText: 'AGE',
//                               hintText: '123456',
//                               labelStyle: TextStyle(
//                                 color: Colors.grey,
//                               ),
//                               focusedBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.grey),
//                               )),
//                           obscureText: true))
//                 ])),
//               ),
//               Container(
//                 margin: EdgeInsets.fromLTRB(30.0, 3.0, 30.0, 0.0),
//                 child: TextField(
//                   keyboardType: TextInputType.name,
//                   onChanged: (value) {
//                     value = profession;
//                   },
//                   decoration: InputDecoration(
//                     labelText: 'PROFESSION',
//                     labelStyle: TextStyle(
//                       color: Colors.grey,
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey),
//                     ),
//                   ),
//                   obscureText: true,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   margin: EdgeInsets.fromLTRB(30.0, 3.0, 30.0, 0.0),
//                   child: TextField(
//                     keyboardType: TextInputType.name,
//                     onChanged: (value) {
//                       value = email;
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'EMAIL',
//                       hintText: '0712345678',
//                       labelStyle: TextStyle(
//                         color: Colors.grey,
//                       ),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   margin: EdgeInsets.fromLTRB(30.0, 3.0, 30.0, 0.0),
//                   child: TextField(
//                     keyboardType: TextInputType.name,
//                     onChanged: (value) {
//                       value = password;
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'PASSWORD',
//                       hintText: '123, kandy road, colombo',
//                       labelStyle: TextStyle(
//                         color: Colors.grey,
//                       ),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               // Padding(
//               //   padding: const EdgeInsets.all(8.0),
//               //   child: Container(
//               //     margin: EdgeInsets.fromLTRB(30.0, 3.0, 30.0, 0.0),
//               //     child: TextField(
//               //       keyboardType: TextInputType.name,
//               //       onChanged: (value) {
//               //         value = affiliation;
//               //       },
//               //       decoration: InputDecoration(
//               //         labelText: 'AFFILIATION',
//               //         hintText: '',
//               //         labelStyle: TextStyle(
//               //           color: Colors.grey,
//               //         ),
//               //         focusedBorder: UnderlineInputBorder(
//               //           borderSide: BorderSide(color: Colors.grey),
//               //         ),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   margin: EdgeInsets.fromLTRB(30.0, 3.0, 30.0, 0.0),
//                   child: TextField(
//                     keyboardType: TextInputType.name,
//                     onChanged: (value) {
//                       value = mobile;
//                     },
//                     decoration: InputDecoration(
//                       labelText: 'MOBILE',
//                       hintText: '',
//                       labelStyle: TextStyle(
//                         color: Colors.grey,
//                       ),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 50.0),
//                 height: 50.0,
//                 width: 150.0,
//                 child: Material(
//                   borderRadius: BorderRadius.circular(20.0),
//                   color: Colors.greenAccent,
//                   child: GestureDetector(
//                     onTap: () async {
//                       try {
//                         var url = Uri.https(
//                             "localhost/covidapp.tk", "/api/v1/create-user");
//                         var res = await http.post(
//                           url,
//                           headers: <String, String>{
//                             'Content-Type': 'application/json; charset=UTF-8',
//                             'Accept': 'application/json; charset=UTF-8',
//                           },
//                           body: jsonEncode(<String, String>{
//                             'user_nic':nic ,
//                             'name': name,
//                             'age': age,
//                             'profession': profession,
//                             'email': email,
//                             'password':password,
//                             'affiliation':affiliation,
//                             'mobile': mobile 
//                           }),
//                         );
//                         if (res.statusCode == 200) {
//                           var jsonResponse = convert.jsonDecode(res.body);
//                           print(jsonResponse);
//                           // Navigator.push(context,
//                           //     MaterialPageRoute(builder: (ctx) => Login()));
//                         } else {
//                           var jsonResponse = convert.jsonDecode(res.body);
//                           print(jsonResponse);
//                           AlertDialog(title: Text(""));
//                         }
//                       } catch (e) {
//                         print(e);
//                       }
//                     },
//                     child: Center(
//                       child: Text(
//                         'REGISTER',
//                         style: TextStyle(fontSize: 19.0, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

























