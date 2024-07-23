import 'package:flutter/material.dart';
import 'package:craftmani/exports.dart';

class CustomNotification {

  double height;
  Color color;
  bool drawable;

  CustomNotification({Key? value, required this.height, this.color=Colors.transparent, this.drawable=false});

  notificationModal(BuildContext context, Widget child){

    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context){
          return Container(
            height: height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
            ),
            child: Center(child: Column(
              children: [
                drawable == false ? Container() :
                Container(
                  height: 4,
                  width: 50,
                  margin: EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                      color: ThemeColor.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                const SizedBox(height: 70),
                child,
              ],
            )),
          );
        }
    );
  }
}