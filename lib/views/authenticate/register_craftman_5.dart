import 'dart:convert';

import 'package:craftmani/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:transition/transition.dart';

import '../app_home/screens/craft_men/craft_man_home.dart';


class RegisterCraftManFive extends StatefulWidget {
  const RegisterCraftManFive({Key? key}) : super(key: key);

  @override
  State<RegisterCraftManFive> createState() => _RegisterCraftManFiveState();
}

class _RegisterCraftManFiveState extends State<RegisterCraftManFive> {

  TextEditingController addressController = TextEditingController();
  String errorText = "";
  bool isLoading = false;
  // ignore: prefer_typing_uninitialized_variables
  double longitude = 1;
  double latitude = 1;


 Future<Position> _determinePosition() async {

   bool serviceEnabled;
   LocationPermission permission;

   serviceEnabled = await Geolocator.isLocationServiceEnabled();
   if(!serviceEnabled){
     setState(() {
       errorText = 'Location services are disabled. Make sure it is on.';
     });
   } else {
     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
     var addr = placemarks.reversed.last;
     addressController.text = "${addr.street}, ${addr.subAdministrativeArea}, ${addr.locality}, ${addr.country}";
     longitude = position.longitude;
     latitude = position.latitude;
   }

   permission = await Geolocator.checkPermission();
   if (permission == LocationPermission.denied) {
     permission = await Geolocator.requestPermission();
     if (permission == LocationPermission.denied) {
       setState(() {
         errorText = 'Location permissions are denied.';
       });
     }
   }

   if (permission == LocationPermission.deniedForever) {
     setState(() {
       errorText = 'Location permissions are permanently denied, we cannot request permissions.';
     });

   }

   return await Geolocator.getCurrentPosition();
 }

  void updateAddress() async {
    var data = {
      "action" : "update_account_address",
      "lon": longitude,
      "lat": latitude,
      'table': 'user_basic_dt',
      'address': addressController.text,
      'user_id': await SessionManager().get("user_id")
    };
    var res = await Requests().loginUser(data, "/request/createAccount");
    res = jsonDecode(res.body);

    if(addressController.text.isNotEmpty){
      isLoading = true;
      errorText = "";
      if(res['success']){

        if(latitude != 1 && longitude != 1){
          await SessionManager().set("user_token", await SessionManager().get("user_id"));
          await SessionManager().remove("user_id");
          setState(() {
            Navigator.push(context, Transition(child: const CraftManHome(), transitionEffect: TransitionEffect.BOTTOM_TO_TOP));
            isLoading = false;
          });
        } else {
          errorText = "Make sure your location services are enabled";
          isLoading = false;
        }
      } else {
        isLoading = false;
      }
    } else {
      setState(() {
        errorText = "Please fill in your address";
      });
    }
  }

  @override
  void initState() {
    _determinePosition();
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PreviousPage(color: ThemeColor.black,),
              const SizedBox(height: 100),
              const HeaderText(text: 'Location'),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: DescriptionText(text: "We are almost there. Please provide your work or residential address so clients within your location can easily find you.")),
                  SizedBox(width: 10),
                  Text('5 / 5',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 10
                    ),
                  )
                ],
              ),

              Lottie.asset('assets/lottie/gps_location.json', height: 200),
              CustomAlert(infoText: errorText),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 70,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: ThemeColor.black.withOpacity(0.5), width: 0.5)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.gps_fixed, size: 20),
                        const SizedBox(width: 15),
                        Expanded(
                            child: TextField(
                              controller: addressController,
                              style: const TextStyle(
                                fontSize: 11,
                                fontFamily: 'Poppins'
                              ),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(top: 1),
                                border: InputBorder.none,
                                errorText: "",
                                errorStyle: TextStyle(
                                  fontSize: 10
                                )
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 40, top: 5),
                    padding: const EdgeInsets.all(5),
                    color: ThemeColor.white,
                    child: const Text('My Address', style: TextStyle(fontSize: 12)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(
              onTap: () {
                setState(() {
                  updateAddress();
                });
              },
              child: SubmitButton(text: "Complete", isLoading: isLoading)
          ),
        )
    );
  }
}
