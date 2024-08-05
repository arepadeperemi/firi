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
    const FlexText(text: "Reviews", icon: Iconsax.profile_2user),
    const FlexText(text: "Catalog", icon: Iconsax.picture_frame),
    const FlexText(text: "Write review", icon: Icons.comment,)
  ];

  List titleScreens = <Widget>[
    const ReviewsScreen(),
    const CatalogueScreen(),
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
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PrevButton(),
                const SizedBox(height: 20,),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("${Get.parameters['image']}"),
                ),
                const SizedBox(height: 16,),
                Text("${Get.parameters['name']}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  ),),
                const SizedBox(height: 20,),
                Text("${Get.parameters['description']}",
                style: const TextStyle(
                  height: 1.5
                ),),
                const SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FlexText(text: '2.5 Rating', icon: Icons.star),
                    const SizedBox(width: 10,),
                    const FlexText(text: "2km", icon: Icons.location_on_rounded),
                    const SizedBox(width: 10,),
                    FlexText(text: "${Get.parameters['craft']}", icon: Icons.person),
                  ],
                ),
                const SizedBox(height: 20,),
                const SizedBox(
                  width: 110,
                  child: FlexText(text: 'Make Call', icon: Icons.phone, isBordered: true),
                ),
                const SizedBox(height: 20,),
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
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: index != currentSelect ? BorderSide.none : BorderSide(
                                      color: Colors.black.withOpacity(0.07)
                                  )
                              )
                          ),
                          child: titles[index]
                    )),
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10,),
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
