import 'package:craftmani/exports.dart';
import 'package:craftmani/views/app_home/screens/shared/edit_user_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:transition/transition.dart';

import '../shared/edit_user_name.dart';


class ClientProfileScreen extends StatefulWidget {
  const ClientProfileScreen({Key? key}) : super(key: key);

  @override
  State<ClientProfileScreen> createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Profile',
                  style: TextStyle(
                    fontFamily: 'Poppins'
                    ),
                  ),
                  Icon(Icons.notifications)
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: ThemeColor.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  children: [
                    GestureDetector(
                    onTap: () => {
                      Navigator.push(context, Transition(child: const EditUserName(),
                      transitionEffect: TransitionEffect.RIGHT_TO_LEFT))
                      },
                      child: Container(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Arepade Peremi'),
                            Icon(Icons.arrow_forward_ios, size: 14)
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(context, Transition(child: const EditUserPhone(),
                            transitionEffect: TransitionEffect.RIGHT_TO_LEFT))
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('09075764656'),
                            Icon(Icons.arrow_forward_ios, size: 14)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('History',
                style: TextStyle(
                  fontFamily: 'Poppins'
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: ThemeColor.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(4, (index) => Container(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: index == 3 ? Colors.transparent : ThemeColor.black.withOpacity(0.3),
                          width: 0.2
                        )
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.phone, size: 14),
                        SizedBox(width: 10),
                        Expanded(
                            child: Text('A phone call was put through today')
                        ),
                      ],
                    ),
                  )),
                ),
              )
            ],
          ),
        )
    );
  }
}
