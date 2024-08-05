import 'package:craftmani/views/app_home/screens/suggested/suggested.dart';
import 'package:flutter/material.dart';
import '../craft_men/craft_men.dart';
import '../houses/houses.dart';
import 'package:iconsax/iconsax.dart';


class ClientSearchScreen extends StatefulWidget {
  const ClientSearchScreen({Key? key}) : super(key: key);

  @override
  State<ClientSearchScreen> createState() => _ClientSearchScreenState();
}

class _ClientSearchScreenState extends State<ClientSearchScreen> {


  final TextEditingController _controller = TextEditingController();


  bool controllerValue = false;
  MainAxisAlignment alignPosition = MainAxisAlignment.center;
  double shiftHeight = 0;
  int count = 2;

  String currentSelect = "My location";
  List<String> items = ['My location', 'Lagos', 'Nigeria'];

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Discover',
                          style: TextStyle(
                              fontSize: 24
                          ),),
                        DropdownButton<String>(
                          value: currentSelect,
                          underline: Container(),
                          icon: const Icon(Iconsax.global),
                          iconSize: 12,
                          items: items.map<DropdownMenuItem<String>>((String item) =>
                              DropdownMenuItem(
                                value: item.toString(),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(item.toString()),
                                )
                              )).toList(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              currentSelect = value!;
                            });
                          }
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    padding: const EdgeInsets.all(10),
                    height: 50,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(1,1),
                          color: Color(0xFFEEEEEE),
                          blurRadius: 1
                        )
                      ]
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search_rounded),
                        SizedBox(width: 10,),
                        Expanded(
                            child: TextField(
                              style: TextStyle(
                                fontSize: 12
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                hintText: "Search places, handy men",
                                hintStyle: TextStyle(
                                  fontSize: 10
                                ),
                                contentPadding: EdgeInsets.only(bottom: 17)
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
        Container(
          margin: const EdgeInsets.only(top: 210),
          padding: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black.withOpacity(.1)
              )
            )
          ),
          child: SingleChildScrollView(
            child: Container(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5, top: 10),
                    child: Text('Suggested For You',
                      style: TextStyle(
                          fontSize: 10
                      ),),
                  ),
                  const SizedBox(height: 10),
                  Suggested(),
                  SizedBox(height: 5),
                  Houses(),
                  SizedBox(height: 15),
                  CraftMen()
                ],
              ),
            ),
          ),
        ),


      ],
    );
  }
}
