import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class Convert {

  convertMilliseconds(int timeStamp){

    var time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    var format = DateFormat('dd/MM/yyyy HH:mm a').format(time);
    return format;
  }

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
