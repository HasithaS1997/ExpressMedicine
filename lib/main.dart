import 'package:flutter/material.dart';
import 'package:loginpage/authenticate/user.dart';

import 'package:loginpage/components/wrapper.dart';
import 'package:loginpage/landingpage.dart';
import 'package:loginpage/screens/homepage.dart';
import 'package:loginpage/screens/login.dart';
import 'package:loginpage/screens/registerpage.dart';
import 'package:loginpage/screens/selectpharmacypage.dart';
//import 'package:loginpage/services/auth.dart';

// ignore: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

// Future <void> main() async {
// WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
  

    // ignore: missing_required_param
    return StreamProvider<User>.value(
      //value: AuthService().user,
      child: MaterialApp(
        home:Login(),
        debugShowCheckedModeBanner:false,
        initialRoute: '/',
      routes: {
        // ignore: missing_required_param
        '/login': (context) => Login(),
        '/register': (context) => RegisterPage(),
        '/Home' : (context) =>Homepage(),
      },
      ),
    );
  }
}
