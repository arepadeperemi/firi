import 'package:flutter/material.dart';
import 'package:craftmani/exports.dart';

class DescriptionText extends StatelessWidget {
  final String text;
  const DescriptionText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 12,
          color: ThemeColor.black
      ),
    );
  }
}
