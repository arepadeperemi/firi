import 'package:craftmani/exports.dart';
import 'package:craftmani/views/app_home/screens/client/client_profile.dart';
import 'package:craftmani/views/app_home/screens/shared/client_search.dart';
import 'package:craftmani/views/app_home/screens/shared/support_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../authenticate/login.dart';


class ClientHome extends StatefulWidget {
  const ClientHome({Key? key}) : super(key: key);

  @override
  State<ClientHome> createState() => _ClientHomeState();
}

class _ClientHomeState extends State<ClientHome> {

  int currentIndex = 0;
  var list = {'name': {}, 'color': {} };
  List pages = [const ClientProfileScreen(), const ClientSearchScreen(), const SupportScreen()];

  closePage() async {
    setState(() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return closePage();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFEEEEEE),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: pages[currentIndex],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: ThemeColor.primary,
          backgroundColor: Color(0xFFEEEEEE),
          color: ThemeColor.primary,
          height: 60,
          index: 0,
          items: const [
            Icon(Icons.home_filled, size: 25, color: ThemeColor.white),
            Icon(Icons.search, size: 25, color: ThemeColor.white),
            Icon(Icons.info_rounded, size: 25, color: ThemeColor.white)
          ],
          onTap: (index){
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
