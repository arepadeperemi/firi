import 'package:craftmani/exports.dart';
import 'package:craftmani/views/app_home/screens/houses/widget/prev_button.dart';
import 'package:craftmani/views/app_home/screens/craft_men/reviews.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../craft_men/widgets/flex_text.dart';

class HouseDetails extends StatefulWidget {
  const HouseDetails({Key? key}) : super(key: key);

  @override
  State<HouseDetails> createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontSize: 12
          ),
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 50),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrevButton(),
                SizedBox(height: 20,),
                Container(
                  height: 300,
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 10, right: 60, bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      image: AssetImage("${Get.parameters['cover']}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.8),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_rounded, size: 14,),
                            SizedBox(width: 5,),
                            Expanded(child: Text('No. 34, comfort villa residence',
                            style: TextStyle(
                              fontSize: 12
                            ),))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                Text("${Get.parameters['house_title']}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),),
                SizedBox(height: 10,),
                Row(
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
                    FlexText(text: 'Enquire', icon: Icons.phone, isBordered: true)
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black.withOpacity(0.07)
                          )
                        )
                      ),
                      child: Text("Reviews"),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: FlexText(text: 'Write review', icon: Icons.comment,),
                    )
                  ],
                ),
                ReviewsScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
