import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftMen extends StatefulWidget {


  const CraftMen({Key? key}) : super(key: key);

  @override
  State<CraftMen> createState() => _CraftMenState();
}

class _CraftMenState extends State<CraftMen> {
  int total_count = 10;

  String name = "Arepade Peremi";
  String image = "assets/images/peremi_avatar.jpg";
  String craft = "Programmer";
  String description = "My name is peremi. I specialise in building top notch softwares for fintechs and businesses";
  String proximity = "2km";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text('Craft Men',
                    style: TextStyle(
                        fontSize: 10
                    ),
                  )
              ),
              const Text('See all',
                style: TextStyle(
                    fontSize: 12
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10,),
        ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 0),
            physics: const ScrollPhysics(),
            itemBuilder:(_, index) => GestureDetector(
              onTap: () => Get.toNamed("/craftmen_details?name=$name&image=$image&craft=$craft&description=$description"),
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: index == (total_count -1) ? 70 : 10),
                decoration: const BoxDecoration(
                  color: Colors.white,

                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(image),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name,
                              style: const TextStyle(
                                  fontSize: 14
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(Icons.work, size: 10, color: Colors.black54),
                                const SizedBox(width: 5,),
                                Text(craft,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.black54
                                  ),),
                                const SizedBox(width: 5,),
                                const Icon(Icons.location_on_rounded, size: 10, color: Colors.black54),
                                const SizedBox(width: 5,),
                                Text(proximity,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.black54
                                  ),),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Text(description,
                              style: const TextStyle(
                                  fontSize: 10
                              ),
                            ),
                          ],
                        ),
                      ),

                    ]),
              ),
            ),
            itemCount: total_count
        )
      ],
    );
  }
}
