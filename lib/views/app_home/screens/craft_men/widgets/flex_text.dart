import 'package:flutter/material.dart';

class FlexText extends StatelessWidget {

  final String text;
  final IconData icon;
  final bool isBordered;

  const FlexText({Key? key,
    required this.text,
    required this.icon,
    this.isBordered=false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isBordered ? EdgeInsets.symmetric(horizontal:15, vertical: 10) : EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        border: isBordered ? Border.all(color: Colors.black.withOpacity(0.09)) : Border(),
      ),
      child: Row(
        children: [
          Icon(icon, size: 13, color: Colors.black.withOpacity(0.7),),
          SizedBox(width: 5,),
          Text(text)
        ],
      ),
    );
  }
}
