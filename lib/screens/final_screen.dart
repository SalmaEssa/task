import 'package:chatApp/providers/usera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LasrScreen extends StatelessWidget {
  static const routeName = "/finalscreen";
  var userName;
  var phoneNumber;
  var adress;

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context).settings.arguments as Map<String, Object>;

    userName = data["name"];
    phoneNumber = data["phone"];
    adress = data["locatotion"];
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
            child: userName == null || phoneNumber == null || adress == null
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
                            adress,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
