import 'package:craftmani/views/app_home/screens/shared/edit_craft_man_address.dart';
import 'package:craftmani/views/app_home/screens/shared/edit_user_phone.dart';
import 'package:craftmani/views/app_home/screens/craft_men/reviews.dart';
import 'package:flutter/material.dart';
import 'package:craftmani/exports.dart';
import 'package:transition/transition.dart';

import '../shared/edit_user_name.dart';


class CraftManProfileScreen extends StatefulWidget {
  const CraftManProfileScreen({Key? key}) : super(key: key);

  @override
  State<CraftManProfileScreen> createState() => _CraftManProfileScreenState();
}

class _CraftManProfileScreenState extends State<CraftManProfileScreen> {

  bool light1 = true;

  final WidgetStateProperty<Icon?> thumbIcon =
  WidgetStateProperty.resolveWith<Icon?>(
        (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
              padding: const EdgeInsets.all(2),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ThemeColor.primary
              ),
              child: const CircleAvatar(
                  maxRadius: 40,
                  backgroundColor: ThemeColor.primary,
                  backgroundImage: AssetImage('assets/images/peremi_avatar.jpg')
              ),
            ),
              const SizedBox(height: 20),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: ThemeColor.white,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: ThemeColor.black.withOpacity(0.3),
                                  width: 0.2
                              )
                          )
                      ),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(context, Transition(child: const EditUserName(),
                              transitionEffect: TransitionEffect.RIGHT_TO_LEFT))
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Arepade Peremi',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, size: 14)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: ThemeColor.black.withOpacity(0.3),
                                  width: 0.2
                              )
                          )
                      ),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(context, Transition(child: const EditUserPhone(),
                              transitionEffect: TransitionEffect.RIGHT_TO_LEFT))
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('09075764656',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, size: 14)
                          ],
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: ThemeColor.black.withOpacity(0.3),
                                  width: 0.2
                              )
                          )
                      ),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(context, Transition(child: const EditCraftManAddress(),
                              transitionEffect: TransitionEffect.RIGHT_TO_LEFT))
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('No.988 Ajah Axis, Lagos state',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                              )
                            ),
                            Icon(Icons.arrow_forward_ios, size: 14)
                          ],
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 10, left: 20, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)
                        ),
                        image: DecorationImage(
                          image: const AssetImage('assets/images/isometric-3d-map-with-location-pins-gps-navigation-vector-background_53562-4805-977687608'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(ThemeColor.white.withOpacity(0.9), BlendMode.overlay)
                        )
                      ),
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Live Location',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Switch(
                                activeColor: ThemeColor.white,
                                inactiveThumbColor: ThemeColor.black.withOpacity(0.7),
                                inactiveTrackColor: ThemeColor.white,
                                activeTrackColor: ThemeColor.primary.withOpacity(.7),
                                materialTapTargetSize: MaterialTapTargetSize.padded,
                                thumbIcon: thumbIcon,
                                value: light1,
                                onChanged: (bool value) {
                                  setState(() {
                                    light1 = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          const Text('By switching on live location, you allow people looking for your services find you faster.',
                            style: TextStyle(
                              fontSize: 9,
                              fontFamily: 'Poppins',
                            ),
                          )
                        ],
                      ),
                    ),


                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Reviews',
                style: TextStyle(
                    fontFamily: 'Poppins'
                ),
              ),
              const SizedBox(height: 10),
              const Flexible(
                child: SingleChildScrollView(
                  child: ReviewsScreen(),
                ),
              )
            ],
          ),
        )
    );
  }
}
