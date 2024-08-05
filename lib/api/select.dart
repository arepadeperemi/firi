
import 'dart:convert';

import 'package:flutter/services.dart';

class Select {

  Future<void> countryData() async {
    final String response = await rootBundle.loadString("assets/json/country.json");
    final data = await json.decode(response);
    return data;
  }

  

  /*static country() async {


    var file_path = "assets/json/country.json";
    var file = await File(file_path);

    return countries.length;
  }*/

}