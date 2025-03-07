import 'dart:convert';

import 'package:craftmani/exports.dart';
import 'package:craftmani/views/authenticate/register_craftman_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:transition/transition.dart';


class RegisterCraftManOne extends StatefulWidget {

  const RegisterCraftManOne({Key? key}) : super(key: key);

  @override
  State<RegisterCraftManOne> createState() => _RegisterCraftManOneState();
}

class _RegisterCraftManOneState extends State<RegisterCraftManOne> {
  TextEditingController nameController = TextEditingController();
  var errorText = "";
  var isLoading = false;

  validateName() async {

    try{

      if(nameController.text != ""){
        isLoading = true;
        errorText = "";
        var data = {
          "action" : "update_account",
          "key": "full_name",
          'value': nameController.text,
          'table': 'user_basic_dt',
          'user_id': await SessionManager().get("user_id")
        };
        var res = await Requests().loginUser(data, "/request/createAccount");
        res = jsonDecode(res.body);
        if(res['success']){

          setState(() {
              isLoading = false;
              Navigator.push(context, Transition(child: const RegisterCraftManTwo(), transitionEffect: TransitionEffect.BOTTOM_TO_TOP));
          });
        } else{
          isLoading = false;
        }
      } else {
        errorText = "Enter your full name";
      }

    } catch(e){
      errorText = e.toString();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PreviousPage(icon: Icons.keyboard_arrow_down, color: ThemeColor.black),
            const SizedBox(height: 100,),
            const HeaderText(text: "Hello Craft Man"),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: DescriptionText(text: "Please proceed to enter your full name")),
                Text('1 / 5',
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),
            CustomInput(
              labelText: 'Full Name',
              inputAction: TextInputAction.done,
              inputController: nameController,
              inputType: TextInputType.text,
              icon: Icons.person,
              inputError: errorText,
            )

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
            onTap: () {
              setState(() {
                validateName();
              });
            },
            child: SubmitButton(text: "Next", isLoading: isLoading,)
        ),
      ),
    );
  }
}
