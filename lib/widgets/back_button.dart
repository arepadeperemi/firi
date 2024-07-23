import 'package:craftmani/exports.dart';
import 'package:flutter/material.dart';

class PreviousPage extends StatelessWidget {

  final Color color;
  final IconData icon;
  final double size;

  const PreviousPage({Key? key,
    this.color = ThemeColor.white,
    this.icon = Icons.keyboard_arrow_down,
    this.size = 40
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.zero,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            icon,
            color: color,
            size: size,
          ),
        ),
    );
  }
}
