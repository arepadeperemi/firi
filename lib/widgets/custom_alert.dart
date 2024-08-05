
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import '../theme/color.dart';


class CustomAlert extends StatelessWidget {

  final String infoText;

  const CustomAlert({Key? key,
    this.infoText = ""
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (infoText == "") {
      return Container();
    } else {
      return Animate(
        effects: const [
          SlideEffect(
            delay: Duration(microseconds: 10000),
            duration: Duration(milliseconds: 800),
            begin: Offset(10, 0)
          )
        ],
        child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFCCabab)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/info.json',
              width: 20
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text(infoText,
                  style: const TextStyle(
                    color: ThemeColor.white,
                    fontSize: 9,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.normal
                  ),
                ),
              ),
            )
          ],
        ),
    ),
      );
    }
  }
}
