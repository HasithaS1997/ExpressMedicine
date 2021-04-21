import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginpage/authenticate/user.dart';
import 'package:loginpage/authenticate/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      // ignore: deprecated_member_use
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign in with email and password
Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
   Future createUserWithEmailAndPassword( 
     String email, String password) async{
       
     }

  //register with email password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:loginpage/authenticate/user.dart';


// abstract class AuthBase{
  
//   User get currentUser;
//   Future<User> signInAnonymously();
//   Future<void> signOut();
// }

// class Auth implements AuthBase{

  
//   @override
//   final _firebaseAuth = FirebaseAuth.instance; 
  
//   User get currentUser => _firebaseAuth.currentUser;
 
//  @override
//   Future<User>signInAnonymously()async{
    
//     final userCredential = await _firebaseAuth.signInAnonymously();
//     return userCredential.user;
//   }
//   @override
//   Future<void>signOut()async{
//     await FirebaseAuth.instance.signOut();
//   }
// }





