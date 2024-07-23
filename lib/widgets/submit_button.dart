import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../exports.dart';

class SubmitButton extends StatelessWidget {

  final String text;
  final bool isLoading;
  const SubmitButton({Key? key,
    this.text = "Text",
    this.isLoading = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
          color: ThemeColor.primary,
          borderRadius: BorderRadius.circular(10)
      ),
      child: isLoading == false ? Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
          )
      ) : Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/loader.json',
              width: 50,
              height: 50,
            ),
            Text('Please wait . . .',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: ThemeColor.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
