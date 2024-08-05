import 'package:craftmani/views/app_home/screens/craft_men/widgets/flex_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../theme/color.dart';

class HouseMore extends StatefulWidget {
  const HouseMore({super.key});

  @override
  State<HouseMore> createState() => _HouseMoreState();
}

class _HouseMoreState extends State<HouseMore> {

  List property = [
    'assets/images/house01.jpeg',
    'assets/images/house02.jpeg'
  ];
  String houseTitle = 'Success villa rentals.';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.chevron_left, size: 30, color: Colors.black,),
                  SizedBox(width: 10,),
                  Text('Back')
                ],
              ),
            ),

            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height -  100,
                child: ListView.separated(
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () => Get.toNamed('/house_details?house_id=id&cover=${property[index]}&house_title=$houseTitle'),
                    child: Container(
                      height: 200,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: .5
                          ),
                          image: DecorationImage(
                              image: AssetImage(property[index]),
                              fit: BoxFit.cover,
                              colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.overlay)
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
                                  Text(houseTitle,
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
                  ),
                  separatorBuilder: (_, index) => SizedBox(height: 10,),
                  itemCount: property.length
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
