import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:chatApp/models/place.dart';
import 'package:flutter/cupertino.dart';

class user {
  final String id;
  final String phoneNumber;
  final String userName;
  final PlaceLocation adress;
  user({this.adress, this.id, this.phoneNumber, this.userName});
}

class Users with ChangeNotifier {
  List<user> _users = [];
  List<user> get users {
    return [..._users];
  }

  Future<String> addUser(
      String phone, String username, PlaceLocation locat) async {
    final url = "https://chatapp-7f791.firebaseio.com/users.json";

    try {
      final response = await http.post(url,
          body: json.encode({
            "UserName": username,
            "PhoneNumber": phone,
            "adress": locat.adress
          }));
      _users.add(user(
          id: json.decode(response.body)['name'],
          adress: locat,
          phoneNumber: phone,
          userName: username));
      notifyListeners();
      return json.decode(response.body)['name'];
    } catch (error) {
      //print("h3h3h3h3h");
      throw error;
    }
  }

  Future<void> feacth() async {
    final url = "https://chatapp-7f791.firebaseio.com/users.json";
    try {
      final response = await http.get(url);
      final data = json.decode(response.body) as Map<String, dynamic>;
      final List<user> loaded = [];
      data.forEach((key, value) {
        loaded.add(user(
            adress: value["adress"],
            id: key,
            phoneNumber: value["PhoneNumber"],
            userName: value["UserName"]));
        _users = loaded;
        notifyListeners();
      });
    } catch (error) {
      throw error;
    }
  }

  user getUserById(String id) {
    return _users.firstWhere((element) => element.id == id);
  }
}
