import 'package:flutter/material.dart';

import '../theme/color.dart';

class AuthText extends StatelessWidget {

  final VoidCallback onPressed;
  final String text;
  const AuthText({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(text,
          style: const TextStyle(
              color: ThemeColor.black,
              fontWeight: FontWeight.bold,
              fontSize: 11
          ),
        )
    );
  }
}
