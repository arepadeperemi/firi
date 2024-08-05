import 'package:flutter/material.dart';
import 'package:craftmani/exports.dart';

class HeaderText extends StatelessWidget {
  final String text;

  const HeaderText({Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 23,
          color: ThemeColor.black,
          fontWeight: FontWeight.bold
      ),
    );
  }
}
