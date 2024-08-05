import 'package:craftmani/views/app_home/screens/suggested/suggested.dart';
import 'package:flutter/material.dart';
import '../craft_men/widgets/flex_text.dart';

class SuggestedInfo extends StatelessWidget {
  const SuggestedInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
          color: Colors.black.withOpacity(0.7),
          fontSize: 13
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        FlexText(text: '2.5 Rating', icon: Icons.star),
                        SizedBox(width: 10,),
                        FlexText(text: '2.5km', icon: Icons.location_on_rounded)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                const SizedBox(
                  width: 130,
                  child: FlexText(text: 'Contact us', icon: Icons.phone, isBordered: true),
                ),
                const SizedBox(height: 20,),
                Text('This business belongs to kunta perezy. Our services cover from home acccessories to personal belongings',
                style: TextStyle(
                  height: 1.5
                ),),
                SizedBox(height: 20,),
                Text('Similar suggestions',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),),
              ],
            ),
          ),
          SizedBox(height: 16,),
          Suggested()
        ],
      ),
    );
  }
}
