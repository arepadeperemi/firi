import 'package:craftmani/exports.dart';
import 'package:flutter/material.dart';

class SettingsMenuItem extends StatelessWidget {

  final String text;
  final bool border;
  final String description;
  const SettingsMenuItem({Key? key, required this.text, this.border=false, this.description=""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: border == false ? Colors.transparent : ThemeColor.black.withOpacity(0.2), width: 0.4),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 100,
                  child: Text(text,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'
                    ),
                  )
              ),
              SizedBox(height: 4),
              Container(
                width: MediaQuery.of(context).size.width - 100,
                child: Text(description,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              )
            ],
          ),
          Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}
