import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrevButton extends StatelessWidget {
  const PrevButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(100)
          ),
          child: Icon(Icons.arrow_back_ios_new_rounded, size: 16,)
      ),
    );
  }
}
