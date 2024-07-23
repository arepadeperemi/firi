import 'package:craftmani/exports.dart';
import 'package:craftmani/views/app_home/screens/craft_men/widgets/flex_text.dart';
import 'package:craftmani/views/app_home/screens/houses/widget/prev_button.dart';
import 'package:craftmani/views/app_home/screens/craft_men/reviews.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../catalogue/catalogue.dart';

class CraftMenDetails extends StatefulWidget {
  const CraftMenDetails({Key? key}) : super(key: key);

  @override
  State<CraftMenDetails> createState() => _CraftMenDetailsState();
}

class _CraftMenDetailsState extends State<CraftMenDetails> {


  List titles = <Widget>[
    FlexText(text: "Reviews", icon: Iconsax.profile_2user),
    FlexText(text: "Catalog", icon: Iconsax.picture_frame),
    FlexText(text: "Write review", icon: Icons.comment,)
  ];

  List titleScreens = <Widget>[
    ReviewsScreen(),
    CatalogueScreen(),
    Container()
  ];

  var currentSelect = 0;

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
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("${Get.parameters['image']}"),
                ),
                SizedBox(height: 16,),
                Text("${Get.parameters['name']}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),),
                SizedBox(height: 20,),
                Text("${Get.parameters['description']}",
                style: TextStyle(
                  height: 1.5
                ),),
                SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlexText(text: '2.5 Rating', icon: Icons.star),
                    SizedBox(width: 10,),
                    FlexText(text: "2km", icon: Icons.location_on_rounded),
                    SizedBox(width: 10,),
                    FlexText(text: "${Get.parameters['craft']}", icon: Icons.person),
                  ],
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: 110,
                  child: FlexText(text: 'Make Call', icon: Icons.phone, isBordered: true),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: (){
                        setState(() {
                          currentSelect = index;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: index != currentSelect ? BorderSide.none : BorderSide(
                                      color: Colors.black.withOpacity(0.07)
                                  )
                              )
                          ),
                          child: titles[index]
                    )),
                    separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10,),
                  ),
                ),
                Container(
                  child: titleScreens[currentSelect],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
