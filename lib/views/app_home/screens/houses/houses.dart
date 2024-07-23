import 'package:craftmani/views/app_home/screens/houses/housing_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../theme/color.dart';

class Houses extends StatefulWidget {
  
  const Houses({Key? key}) : super(key: key);

  @override
  State<Houses> createState() => _HousesState();
}

class _HousesState extends State<Houses> {

  List property = [
    'assets/images/house01.jpeg',
    'assets/images/house02.jpeg'
  ];
  String houseTitle = 'Success villa rentals.';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Categories(),
        SizedBox(height: 10,),
        Container(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => index == property.length  ?
              SizedBox(
                height: 200,
                width: 60,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: ThemeColor.primary,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16,)
                  ),
                ),
              ) :
              GestureDetector(
                onTap: () => Get.toNamed('/house_details?house_id=id&cover=${property[index]}&house_title=$houseTitle'),
                child: Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: ThemeColor.primary,
                          width: .5
                      ),
                      image: DecorationImage(
                          image: AssetImage(property[index]),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.overlay)
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            )
                        ),
                        child: Text(houseTitle,
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              itemCount: property.length + 1
          ),
        )
      ],
    );
  }
}
