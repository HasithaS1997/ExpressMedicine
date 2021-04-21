import 'package:flutter/material.dart';

import 'package:loginpage/ordertracking/stylescheme.dart';
import 'package:loginpage/screens/homepage.dart';
//import 'OrderConfirmPage.dart';


void main() {
  runApp(TrackOrderPage());
}
class TrackOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: trackOrderPage(),
    );
  }
}
// ignore: camel_case_types
class trackOrderPage extends StatefulWidget {
  @override
  _trackOrderPageState createState() => _trackOrderPageState();
}

// ignore: camel_case_types
class _trackOrderPageState extends State<trackOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // ignore: missing_required_param
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            color: Colors.grey,
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));
            },
          ),
        ],
        title: Text("Track Order", style: TextStyle(
            color: Colors.black
        ),),
        // actions: [
        //   // ignore: missing_required_param
        //   IconButton(
        //     icon: Icon(Icons.search),
        //   )
        // ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order Number 1001", style: headingStyle,),
            Text("Order confirmed. Estimated Time 30 Minutes", style: contentStyle.copyWith(
              color: Colors.grey,
              fontSize: 16
            ),),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 1,
              color: Colors.grey,
            ),
           Stack(
             children: [
               Container(
                 margin: EdgeInsets.only(left: 13, top: 50),
                 width: 4,
                 height: 400,
                 color: Colors.grey,
               ),
               Column(
                 children: [
                   statusWidget('orderplaced', "Order Placed", true),
                   statusWidget('orderconfirmed', "Order Confirmed", false),
                   statusWidget('orderprocessed', "Order Pocessed", false),
                   statusWidget('deliveryread', "Ready to Deliver", false),
                   
                 ],
               )
             ],
           ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 1,
              color: Colors.grey,
            ),

           

          ],
        ),
      ),
     
    );
  }
  Container statusWidget(String img, String status, bool isActive)
  {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 30,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (isActive) ? Colors.blue : Colors.white,
              border: Border.all(
                color: (isActive) ? Colors.transparent : Colors.blue,
                width: 3
              )
            ),
          ),
          SizedBox(width: 50,),
          Column(
            children: [
              Container(
                height: 45,
                width: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/$img.png"),
                        fit: BoxFit.contain
                    )
                ),
              ),
              Text(status, style: contentStyle.copyWith(
                  color: (isActive) ? Colors.black : Colors.black
              ),)
            ],
          )
        ],
      ),
    );
  }
}