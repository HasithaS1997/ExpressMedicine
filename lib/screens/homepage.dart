import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/main.dart';
import 'package:loginpage/models/Addcard.dart';
import 'package:loginpage/ordertracking/ordertrack.dart';
import 'package:loginpage/screens/login.dart';
import 'package:loginpage/screens/profilepage.dart';
import 'package:loginpage/screens/uploadprescriptionpage.dart';
import 'package:loginpage/services/auth.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final LocalStorage storage = new LocalStorage('MEDICINEAPP');
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
            color: Colors.grey,
            icon: Icon(Icons.logout),
            onPressed: () {
              storage.clear();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 40.0,
                    top: 10.0,
                  ),
                  child: Text(
                    'Search Medicine',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 40.0,
                    top: 10.0,
                  ),
                  child: Text(
                    'Upload Prescription',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (ctx)=> UploadPrescriptionPage()));
                    },
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/search.png',
                            width: 110.0, height: 120.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.fromLTRB(50.0, 0.0, 30.0, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (ctx)=> MyHomePage()));
                    },
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/prescription.png',
                            width: 110.0, height: 100.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 40.0,
                    top: 40.0,
                  ),
                  child: Text(
                    'Order Tracking',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 60.0,
                    top: 40.0,
                  ),
                  child: Text(
                    'Payment Options',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.fromLTRB(60.0, 10.0, 30.0, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => TrackOrderPage()));
                    },
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/tracking.png',
                            width: 110.0, height: 120.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 30.0, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => AddcardPage()));
                    },
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/payment.png',
                            width: 110.0, height: 100.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 133.0,
                    top: 40.0,
                  ),
                  child: Text(
                    'Manage Profile',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.fromLTRB(145.0, 10.0, 30.0, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/edit.png',
                            width: 110.0, height: 120.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                left: 10.0,
                top: 60.0,
              ),
              child: Text(
                'EXPRESS MEDICINE',
                style: TextStyle(fontSize: 20.0, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
