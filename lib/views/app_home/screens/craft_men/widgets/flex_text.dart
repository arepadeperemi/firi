import 'package:flutter/material.dart';

class FlexText extends StatelessWidget {

  final String text;
  final IconData icon;
  final bool isBordered;
  final Color background;
  final Color iconColor;

  const FlexText({Key? key,
    required this.text,
    required this.icon,
    this.isBordered=false,
    this.background=Colors.white,
    this.iconColor=Colors.black54
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isBordered ? const EdgeInsets.symmetric(horizontal:15, vertical: 10) : EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: background,
        border: isBordered ? Border.all(color: Colors.black.withOpacity(0.09)) : const Border(),
      ),
      child: Row(
        children: [
          Icon(icon, size: 13, color: iconColor),
          const SizedBox(width: 5,),
          Text(text)
        ],
      ),
    );
  }
}
