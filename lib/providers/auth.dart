import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthB with ChangeNotifier {
  Timer? _authTimer;
  String? _idToken, userId;
  DateTime? _expiryDate;

  String? _tempidToken, tempuserId;
  DateTime? _tempexpiryDate;

  Future<void> tempData() async {
    _idToken = _tempidToken;
    userId = tempuserId;
    _expiryDate = _tempexpiryDate;

    final sharedPref = await SharedPreferences.getInstance();

    final mapShared = jsonEncode({
      '_token': _tempidToken,
      '_userId': tempuserId,
      '_expiryDate': _tempexpiryDate!.toIso8601String()
    });

    sharedPref.setString('authData', mapShared);

    notifyListeners();
  }

  bool get isAuth {
    return token != '';
  }

  String get token {
    if (_idToken != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _expiryDate != null) {
      return _idToken.toString();
    } else {
      return '';
    }
  }

  Future<void> signUp(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDG8z_bbR4ubvq_EtTJ6EdUqgSw6_MYVHA");

    try {
      var response = await http.post(
        url,
        body: jsonEncode(
          {
            "email": email,
            "password": password,
            "returnSecureToken": true,
          },
        ),
      );

      var responseData = jsonDecode(response.body);

      if (responseData['error'] != null) {
        throw responseData['error']['message'];
      }

      _tempidToken = responseData['idToken'];
      tempuserId = responseData['localId'];
      _tempexpiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      _autoLogout(int.parse(responseData['expiresIn']) - 60);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signIn(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDG8z_bbR4ubvq_EtTJ6EdUqgSw6_MYVHA");

    try {
      var response = await http.post(
        url,
        body: jsonEncode(
          {
            "email": email,
            "password": password,
            "returnSecureToken": true,
          },
        ),
      );

      var responseData = jsonDecode(response.body);

      if (responseData['error'] != null) {
        throw responseData['error']['message'];
      }

      _tempidToken = responseData['idToken'];
      tempuserId = responseData['localId'];
      _tempexpiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      _autoLogout(int.parse(responseData['expiresIn']) - 60);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> logout() async {
    _idToken = null;
    userId = null;
    _expiryDate = null;

    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }

    final pref = await SharedPreferences.getInstance();
    pref.clear();

    notifyListeners();
  }

  void _autoLogout(timer) {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }

    _authTimer = Timer(Duration(seconds: timer), logout);
  }

  Future<bool> autoLogin() async {
    final pref = await SharedPreferences.getInstance();

    if (!pref.containsKey('authData')) {
      return false;
    }

    final authData =
        jsonDecode(pref.get('authData').toString()) as Map<String, dynamic>;

    final myExpiredDate = DateTime.parse(authData["_expiryDate"]);
    final myTokenData = authData["_token"];
    final myUserId = authData["_userId"];

    if (myExpiredDate.isBefore(DateTime.now())) {
      return false;
    }

    _idToken = myTokenData;
    userId = myUserId;
    _expiryDate = myExpiredDate;
    notifyListeners();

    return true;
  }
}
