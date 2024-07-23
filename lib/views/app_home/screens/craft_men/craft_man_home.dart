import 'package:craftmani/exports.dart';
import 'package:craftmani/views/app_home/screens/shared/client_search.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:craftmani/views/app_home/screens/shared/support_screen.dart';
import 'package:craftmani/views/app_home/screens/catalogue/craft_man_catalogue.dart';
import 'package:craftmani/views/app_home/screens/craft_men/craft_man_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../authenticate/login.dart';


class CraftManHome extends StatefulWidget {
  const CraftManHome({Key? key}) : super(key: key);

  @override
  State<CraftManHome> createState() => _CraftManHomeState();
}

class _CraftManHomeState extends State<CraftManHome> {

  int currentIndex = 0;
  var list = {'name': {}, 'color': {} };
  List pages = const [
    ClientSearchScreen(),
    CraftManProfileScreen(),
    CraftManCatalogueScreen(),
    SupportScreen()
  ];

  closePage() async {
    setState(() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
    });

  }

  Widget button(int index, IconData icon) {
    return GestureDetector(
      onTap: () => {
        setState((){
          currentIndex = index;
        })
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(icon, size: 18, color: currentIndex == index ? Colors.white60 : Colors.white,)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        return closePage();
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: Color(0xFFEFEFEF),
        body: pages[currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            width: double.maxFinite,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ThemeColor.primary,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFE5E5E5),
                  blurRadius: 2,
                  offset: Offset(1.0,1.0),
                  spreadRadius: .5
                )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(0, Iconsax.home),
                button(1, Iconsax.user),
                button(2, Iconsax.gallery),
                button(3, Iconsax.setting),
              ],
            ),
          ),
        )
      ),
    );
  }
}
