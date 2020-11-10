import 'package:chatApp/providers/usera.dart';
import 'package:chatApp/screens/after_confirm_screen.dart';
import 'package:chatApp/screens/auth.dart';
import 'package:chatApp/screens/confirm_screen.dart';
import 'package:chatApp/screens/final_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Users(),
      child: MaterialApp(
        title: 'Intern App',
        theme:
            ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.amber),
        home: AuthScreen(),
        routes: {
          ConfirmScreen.routeName: (ctx) => ConfirmScreen(),
          AfterConformScreen.routeName: (ctx) => AfterConformScreen(),
          LasrScreen.routeName: (ctx) => LasrScreen(),
        },
      ),
    );
  }
}
