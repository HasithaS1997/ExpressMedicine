// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:loginpage/screens/homepage.dart';
// import 'package:loginpage/screens/login.dart';
// import 'package:loginpage/services/auth.dart';

// import 'authenticate/user.dart';

// class Landingpage extends StatefulWidget {
//   const Landingpage({Key key, @required this.auth}) : super(key: key);
//   final AuthBase auth;

  
//   @override
//   _LandingpageState createState() => _LandingpageState();
// }

// class _LandingpageState extends State<Landingpage> {

//    User _user;

// @override
// void initState(){
//   super.initState();
//   _updateUser(widget.auth.currentUser);
// }
  







//    void _updateUser(User user){
//     setState(() {
//       _user = user;
//     });
//    }

//   @override
//   Widget build(BuildContext context) {
//     if(_user == null){
//     // ignore: missing_required_param
//     return Login(
//       auth: widget.auth,

//     );
    
      
//     }
//     return HomePage(
//       auth: widget.auth,
//     onSignOut: () => _updateUser(null),
//     );
//   }

// }
