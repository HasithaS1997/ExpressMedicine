import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectPharmacyPage extends StatefulWidget {
  @override
  _SelectPharmacyPageState createState() => _SelectPharmacyPageState();
}

class _SelectPharmacyPageState extends State<SelectPharmacyPage> {
  String cityDropdownValue = 'Anuradhapura';
  String pharmacyDropdownValue = 'Anura Pharmacy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            color: Colors.grey,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              color: Colors.grey,
              icon: Icon(Icons.logout),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                child: Container(
                  margin: EdgeInsets.only(top: 30.0),
                  alignment: Alignment.topCenter,
                  child: Text(
                    'SELECT PHARMACY',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 25.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10.0,
                  top: 50.0,
                ),
                child: Text(
                  'Select your City and preferred pharmacy',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30.0, top: 50.0),
                    child: Text(
                      'City                 :',
                      style: TextStyle(color: Colors.grey[600], fontSize: 16.0),
                    ),
                  ),
                  Container(
                    height: 35.0,
                    margin: EdgeInsets.only(left: 15.0, top: 50.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      child: DropdownButton<String>(
                        value: cityDropdownValue,
                        icon: Icon(Icons.arrow_drop_down_outlined),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.black),
                        underline: Container(
                          height: 1.0,
                          color: Colors.grey,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            cityDropdownValue = newValue;
                          });
                        },
                        items: <String>[
                          'Anuradhapura',
                          'Colombo',
                          'Gampaha',
                          'Kurunegala',
                          'Jaffna',
                          'Galle',
                          'Kandy',
                          'Matara'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30.0, top: 30.0),
                    child: Text(
                      'Pharmacy       :',
                      style: TextStyle(color: Colors.grey[600], fontSize: 16.0),
                    ),
                  ),
                  Container(
                    height: 35.0,
                    margin: EdgeInsets.only(left: 15.0, top: 30.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      child: DropdownButton<String>(
                        value: pharmacyDropdownValue,
                        icon: Icon(Icons.arrow_drop_down_outlined),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.black),
                        underline: Container(
                          height: 1.0,
                          color: Colors.grey,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            pharmacyDropdownValue = newValue;
                          });
                        },
                        items: <String>[
                          'Anura Pharmacy',
                          'Colombo Pharmacy',
                          'Grand Pharmacy',
                          'Kurunegala Pharmacy',
                          'New Pharmacy',
                          'City Pharmacy',
                          'Lalith Pharmacy',
                          'Medi Pharmacy'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0),
                height: 50.0,
                width: 150.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue,
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        'NEXT',
                        style: TextStyle(fontSize: 19.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
