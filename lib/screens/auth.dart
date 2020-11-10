import 'package:chatApp/screens/after_confirm_screen.dart';
import 'package:chatApp/screens/confirm_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
/*
class LoginScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _userController = TextEditingController();

  final _codeController = TextEditingController();

  Future<bool> loginUser(String phone, BuildContext context) async {
    print("jjjjjjjjjjjjj");
    print(phone);
    //AuthResult _auth = await FirebaseAuth.instance;

    await Firebase.initializeApp();
    FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 5),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          var result = await _auth.signInWithCredential(credential);

          var user = result.user;

          if (user != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AfterConformScreen(
                        _userController.text, _phoneController.text)));
          } else {
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (exception) {
          print("salommmmmmmmmmmmmmmmmmmm");
          print(exception.message);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          print("jkkkkkkkkkkkkkkkkkkkkkkkkkkkkj");

          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Give the code?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId, smsCode: code);

                        var result =
                            await _auth.signInWithCredential(credential);

                        FirebaseUser user = result.user;

                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AfterConformScreen(
                                      _userController.text,
                                      _phoneController.text)));
                        } else {
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(211, 211, 211, 1)),
        padding: EdgeInsets.all(32),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Login",
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 36,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[200])),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[300])),
                    filled: true,
                    fillColor: Colors.grey[100],
                    hintText: "Mobile Number"),
                controller: _phoneController,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[200])),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey[300])),
                    filled: true,
                    fillColor: Colors.grey[100],
                    hintText: "User Name "),
                controller: _userController,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  child: Text("Verify"),
                  textColor: Colors.white,
                  padding: EdgeInsets.all(16),
                  onPressed: () {
                    final phone = _phoneController.text.trim();

                    loginUser(phone, context);
                  },
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
 */

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreen createState() => _AuthScreen();
}

class _AuthScreen extends State<AuthScreen> {
  final _userNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  void _saveForm() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Data")),
      body: Form(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Color.fromRGBO(211, 211, 211, 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "User Name"),
                  controller: _userNameController,
                ),
                SizedBox(height: 100),
                TextFormField(
                  decoration: InputDecoration(labelText: "Mobile Number"),
                  controller: _phoneNumberController,
                ),
                SizedBox(height: 100),
                RaisedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(ConfirmScreen.routeName, arguments: {
                    "user_Name": _userNameController.text,
                    "phone_number": _phoneNumberController.text
                  }),
                  child: Text(
                    "Submit",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue),
                  ),
                  color: Color.fromRGBO(211, 211, 211, 1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
