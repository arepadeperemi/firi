import 'package:flutter/material.dart';

import '../theme/color.dart';

class IosMenuListItem extends StatelessWidget {
  final String text;
  final double textSize;
  final String fontFamily;
  final double iconSize;
  final bool underline;
  final IconData icon;
  final Color iconColor;

  const IosMenuListItem({Key? key,
    required this.text,
    this.textSize = 12,
    this.fontFamily = 'Poppins',
    this.iconSize=14,
    this.underline = true,
    this.icon = Icons.arrow_forward_ios,
    this.iconColor = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: underline == true ? ThemeColor.black.withOpacity(0.3) : Colors.transparent,
                  width: 0.2
              )
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(fontFamily: fontFamily, fontSize: textSize),),
          Icon(icon, size: iconSize, color: iconColor)
        ],
      ),
    );
  }
}
