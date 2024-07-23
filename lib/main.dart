import 'package:craftmani/views/app_home/screens/craft_men/craft_men_details.dart';
import 'package:craftmani/views/app_home/screens/houses/house_details.dart';
import 'package:craftmani/views/app_home/screens/houses/houses.dart';
import 'package:craftmani/views/app_home/screens/suggested/suggested_details.dart';
import 'package:flutter/material.dart';
import 'exports.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
  theme: ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
  ),
  debugShowCheckedModeBanner: false,
  home: const SplashScreen(),
  defaultTransition: Transition.rightToLeft,
  getPages: [
    GetPage(name: '/houses', page: () => Houses()),
    GetPage(name: '/house_details', page: () => const HouseDetails()),
    GetPage(name: '/craftmen_details', page: () => const CraftMenDetails()),
    GetPage(name: '/suggested-details', page: () => SuggestedDetails())
  ],
));

