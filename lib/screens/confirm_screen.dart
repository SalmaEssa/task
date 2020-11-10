import 'dart:convert';
import 'dart:ffi';

import 'package:chatApp/screens/after_confirm_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConfirmScreen extends StatefulWidget {
  static const routeName = "/ConfirmScreen";
  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  Void confirm(BuildContext context, Map<String, dynamic> m) {
    Navigator.of(context).pushReplacementNamed(AfterConformScreen.routeName,
        arguments: {
          "userName": m["user_Name"],
          "phoneNumber": m["phone_number"]
        });
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("User Data"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(211, 211, 211, 1)),
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Confirm Code"),
                ),
                SizedBox(
                  height: 50,
                ),
                FlatButton(
                  onPressed: () => confirm(context, data),
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  textColor: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
