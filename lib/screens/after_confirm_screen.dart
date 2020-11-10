import 'dart:convert';
import 'package:chatApp/helpers/location_helper.dart';
import 'package:chatApp/models/place.dart';
import 'package:chatApp/screens/final_screen.dart';
import 'package:provider/provider.dart';

import 'package:chatApp/widgets/bottomsheetscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AfterConformScreen extends StatefulWidget {
  static const routeName = "/afterConfirm";

  @override
  _AfterConformScreenState createState() => _AfterConformScreenState();
}

class _AfterConformScreenState extends State<AfterConformScreen> {
  String userName;
  String phoneNumber;
  String id;
  void buttomshet() {
    showModalBottomSheet(
        context: context,
        builder: (btx) {
          return BottomSheetscreen(phoneNumber, userName);
        });
    /* Navigator.of(context)
        .pushReplacementNamed(LasrScreen.routeName, arguments: id); */
  }

  @override
  void didChangeDependencies() {
    var rseved =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    // TODO: implement didChangeDependencies

    userName = rseved["userName"];

    phoneNumber = rseved["phoneNumber"];

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Entered Data"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color.fromRGBO(211, 211, 211, 1)),
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 100, bottom: 100),
            child: userName == null || phoneNumber == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: Text(
                            userName,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: Text(
                            phoneNumber,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      RaisedButton(
                        onPressed: buttomshet,
                        child: Text(
                          "Complete you data",
                          style: TextStyle(color: Colors.blue),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
