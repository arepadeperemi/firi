import 'package:flutter/material.dart';
import 'package:craftmani/exports.dart';

class MenuList extends StatelessWidget {

  final Widget widget;
  final String title;
  final bool bottomBorder;

  const MenuList({Key? key, required this.title, required this.widget, this.bottomBorder=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                width: 0.5,
                color: bottomBorder == true ? Colors.grey.withAlpha(50) : Colors.transparent
            )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold
              )
          ),
          widget,
        ],
      ),
    );
  }
}
