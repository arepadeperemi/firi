import 'package:craftmani/exports.dart';
import 'package:craftmani/views/authenticate/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {

  logOutUser() async {
    await SessionManager().remove('user_token');
    setState(() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Column(
            children: [
              const BrandLogo(size: 70),
              const SizedBox(height: 10,),
              const HeaderText(text: 'CraftMani'),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: ThemeColor.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    const IosMenuListItem(text: 'FAQs'),
                    const IosMenuListItem(text: 'Contact Support'),
                    const IosMenuListItem(text: 'Terms and Conditions'),
                    GestureDetector(
                      onTap: () {
                        logOutUser();
                      },
                        child: const IosMenuListItem(text: "Log out", underline: false, icon: Icons.power_settings_new, iconColor: ThemeColor.red,)
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text('CraftMani 2023. V0.1', style: TextStyle(fontSize: 10))
            ],
          ),
        )
    );
  }
}
