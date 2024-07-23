import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Suggested extends StatelessWidget {
  const Suggested({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    List property = [
      'assets/images/furniture.webp',
      'assets/images/laundry_store.jpg',
      'assets/images/book_store.jpg',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 5, top: 10),
          child: Text('Suggested For You',
          style: TextStyle(
            fontSize: 10
          ),),
        ),
        SizedBox(height: 10),
        CarouselSlider(
          options: CarouselOptions(
            height: 120,
            enlargeFactor: 0.2,
            enlargeCenterPage: true
          ),
          items: property.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () => Get.toNamed('suggested-details?cover=$i'),
                  child: Container(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.white),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("$i")
                        ),
                        //color: Colors.amber
                    ),
                  ),
                );
              },
            );
          }).toList(),
        )
      ],
    );
  }
}
