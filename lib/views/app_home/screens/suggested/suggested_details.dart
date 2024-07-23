import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class SuggestedDetails extends StatefulWidget {

  @override
  State<SuggestedDetails> createState() => _SuggestedDetailsState();
}

class _SuggestedDetailsState extends State<SuggestedDetails> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 250,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border(
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
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          margin: EdgeInsets.only(top: 10, left: 20),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.black54.withOpacity(0.4)
                          ),
                          child: const Icon(Icons.chevron_left, color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                color: Colors.white,
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Container(
                      padding:   EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: index != currentIndex ? BorderSide.none : BorderSide(
                              color: Colors.black.withOpacity(0.2)
                          )
                        )
                      ),
                      child: Row(
                        children: [
                          Icon(Iconsax.info_circle,
                            color: index == currentIndex ? Colors.black.withOpacity(0.2) : Colors.black,
                            size: 14,
                          ),
                          SizedBox(width: 10),
                          Text('Info',
                          style: TextStyle(
                            fontSize: 12,
                            color: index == currentIndex ? Colors.black.withOpacity(0.2) : Colors.black
                          ),)
                        ],
                      )
                    ),
                  ),
                  separatorBuilder: (_, index) => SizedBox(width: 10,),
                  itemCount: 3,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
