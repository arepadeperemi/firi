import 'package:craftmani/exports.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BrandLogo extends StatelessWidget {
  final Color color;
  final double size;
  final MainAxisAlignment alignment;

  const BrandLogo({Key? key,
    this.color = Colors.white,
    this.size = 30,
    this.alignment = MainAxisAlignment.center
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ThemeColor.primary, width: 0.5)
      ),
      child: Lottie.asset('assets/lottie/bouncing_marker.json',
          height: size + 10
      ),
    );
  }
}
