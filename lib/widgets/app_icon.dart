import 'package:craftmani/exports.dart';
import 'package:flutter/material.dart';


class AppIcon extends StatelessWidget {
  
  final IconData icon;
  final bool alert;
  
  const AppIcon({Key? key, required this.icon, this.alert=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ThemeColor.black.withOpacity(0.5)
      ),
      child: Stack(
        children: [
          Icon(icon,
            color: ThemeColor.white, size: 20,
          ),
          Container(
              margin: const EdgeInsets.only(left: 14, top: 10),
              child: alert == true ?  const Icon(Icons.circle, size: 8, color: Colors.red,): Container()
          )
        ],
      ),
    );
  }
}
