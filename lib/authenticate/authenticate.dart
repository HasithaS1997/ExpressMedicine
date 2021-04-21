
// //import 'package:DriverApp/screens/register.dart';
// import 'package:flutter/material.dart';
// import 'package:loginpage/screens/login.dart';

// class Authenticate extends StatefulWidget {
//   @override
//   _AuthenticateState createState() => _AuthenticateState();
// }

// class _AuthenticateState extends State<Authenticate> {

// bool showSignIn = true;
// void toggleview(){
//   setState(() => showSignIn = ! showSignIn  );
// }
//   @override
//   Widget build(BuildContext context) {
//     if(showSignIn){
//       return Login(toggleview: toggleview);
//     }else{
//       //return RegisterScreen(toggleview: toggleview);
//     }
//   }
// }


























// // import 'package:DriverApp/models/http_extension.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';


// class Authentication with ChangeNotifier    
// {
//   void register(String authData, String authData2) {}

//   // ignore: non_constant_identifier_names
//   SIGNUP(String authData, String authData2) {}

//   login(String authData, String authData2) {}

// }
// Future<void> register(String email, String password) async
// {
//      // ignore: unused_local_variable
//      const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=AIzaSyD1Y5ejbztcgki3U_XOlGt1f_PU2AAlOjU';

// try{
//       final response = await http.post(url, body: json.encode(
//           {
//             'email' : email,
//             'password' : password,
//             'returnSecureToken' : true,
//           }
//       ));
//       final responseData = json.decode(response.body);
// //      print(responseData);
//       if(responseData['error'] != null)
//       {
//         throw HttpException(responseData['error']['message']);
//       }

//     } catch (error)
//     {
//       throw error;
//     }

//   }

//   Future<void> logIn(String email, String password) async
//   {
//     const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyD1Y5ejbztcgki3U_XOlGt1f_PU2AAlOjU ';

//     try{
//       final response = await http.post(url, body: json.encode(
//           {
//             'email' : email,
//             'password' : password,
//             'returnSecureToken' : true,
//           }
//       ));
//       final responseData = json.decode(response.body);
//       if(responseData['error'] != null)
//       {
//         throw HttpException(responseData['error']['message']);
//       }
// //      print(responseData);

//     } catch(error)
//     {
//       throw error;
//     }

//   }
   

    















