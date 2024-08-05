import 'package:craftmani/exports.dart';
import 'package:craftmani/views/app_home/screens/craft_men/craft_man_home.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';



class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PreviousPage(color: ThemeColor.black),
              SizedBox(height: 70),
              HeaderText(text: 'Terms and Conditions'),
              SizedBox(height: 20),
              Text('By proceeding with this setup you agree that you have read the terms and conditions of this'
                  'and its use')
            ],
          ),
        ),
      ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(context, Transition(child: const CraftManHome(), transitionEffect: TransitionEffect.BOTTOM_TO_TOP));
                });
              },
              child: const SubmitButton(text: "Yes I understand", /*isLoading: isLoading*/)
          ),
        ),
    );
  }
}
