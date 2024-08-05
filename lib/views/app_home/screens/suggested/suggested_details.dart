import 'package:craftmani/views/app_home/screens/catalogue/catalogue.dart';
import 'package:craftmani/views/app_home/screens/craft_men/reviews.dart';
import 'package:craftmani/views/app_home/screens/craft_men/widgets/flex_text.dart';
import 'package:craftmani/views/app_home/screens/craft_men/write_review.dart';
import 'package:craftmani/views/app_home/screens/suggested/info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SuggestedDetails extends StatefulWidget {
  const SuggestedDetails({super.key});


  @override
  State<SuggestedDetails> createState() => _SuggestedDetailsState();
}

class _SuggestedDetailsState extends State<SuggestedDetails> {
  var currentIndex = 0;

  var tabs = [
    const SuggestedInfo(),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const CatalogueScreen(),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const ReviewsScreen(),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const WriteReview(),
    ),
  ];

  List<FlexText> tabTitles = [
    FlexText(text: 'Details', icon: Iconsax.info_circle),
    FlexText(text: 'Catalogue', icon: Iconsax.picture_frame),
    FlexText(text: 'Reviews', icon: Icons.comment),
    FlexText(text: 'Write review', icon: Iconsax.info_circle)
  ];

  var icons = [

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  padding: EdgeInsets.only(top: 30),
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.chevron_left, size: 30, color: Colors.black,),
                        SizedBox(width: 10,),
                        Text('Back')
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: const Border(
                      bottom: BorderSide(
                        width: 0.5,
                        color:  Color(0xFFCCCCCC)
                      )
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("${Get.parameters['cover']}")
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        color: Colors.black.withOpacity(.4),
                        child: DefaultTextStyle(
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${Get.parameters['suggested_title']}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                ),),
                              SizedBox(height: 10,),
                              FlexText(text: 'No. 56233, Kujore street, Ogudu', icon: Iconsax.safe_home, background: Colors.transparent, iconColor: Colors.white,),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black
                          ),
                          child: Container(
                            padding:   const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: index != currentIndex ? BorderSide.none : BorderSide(
                                    color: Colors.black.withOpacity(0.2)
                                )
                              )
                            ),
                            child: tabTitles[index]
                          ),
                        ),
                      ),
                      separatorBuilder: (_, index) => const SizedBox(width: 10,),
                      itemCount: 4,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: tabs[currentIndex],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
