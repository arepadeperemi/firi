import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class Suggested extends StatelessWidget {
  const Suggested({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    List property = [
      'assets/images/furniture.webp',
      'assets/images/laundry_store.jpg',
      'assets/images/book_store.jpg',
    ];

    String title = "Slick Home Appliances and More";

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          width: double.maxFinite,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => GestureDetector(
                onTap: () => Get.toNamed('suggested-details?cover=${property[index]}&suggested_title=$title'),
                child: Container(
                  width: 200,
                  margin: EdgeInsets.only(left: 10, right: index == property.length - 1 ? 10 : 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.white),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("${property[index]}")
                    ),
                    //color: Colors.amber
                  ),
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    padding: const EdgeInsets.only(left: 10, top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(.4)
                    ),
                    child: Text(title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13
                    ),),
                  ),
                ),
              ),
            itemCount: property.length
          ),
        )
      ],
    );
  }
}
