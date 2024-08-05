import 'dart:convert';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;

class Requests
{
  final String api = "http://192.168.1.8:100";

  _setHeaders() => {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept':  'application/json'
  };

  loginUser(data, route) async {
      var uri = Uri.parse(api+route);
      return await http.post(
          uri,
          body: jsonEncode(data),
          headers: _setHeaders()
      );
  }

  Future setSession(String key, String value) async {
    await SessionManager().set(key, value);
  }

  Future getSession(id) async {
    await SessionManager().get(id);
  }

  userData(key) async {
    var data = {
      'action': 'fetch_user',
      'user_id': await SessionManager().get("user_token")
    };
    final res = Requests().loginUser(data, "/request/createAccount");
    if(res['success']){
      return jsonDecode(res.body)[key];
    } else {
      return "undefined";
    }

  }


}
