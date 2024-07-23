import 'dart:convert';

import 'package:craftmani/views/authenticate/register_craftman_3.dart';
import 'package:flutter/material.dart';
import 'package:craftmani/exports.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:transition/transition.dart';

import '../../api/convert.dart';
import '../../api/request.dart';



class RegisterCraftManTwo extends StatefulWidget {
  const RegisterCraftManTwo({Key? key}) : super(key: key);

  @override
  State<RegisterCraftManTwo> createState() => _RegisterCraftManTwoState();
}

class _RegisterCraftManTwoState extends State<RegisterCraftManTwo> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  String response = "";
  String errorText = "";
  bool isLoading = false;

  void setPassword() async {

    if(passwordController.text.isNotEmpty){
      errorText = "";

      if(passwordController.text == passwordConfirmController.text){
        response = "";
        isLoading = true;
        var data = {
          "action" : "update_account",
          "key": "user_pwd",
          'table': 'user_secure_dt',
          'value': Convert().generateMd5(passwordController.text),
          'user_id': await SessionManager().get("user_id")
        };
        var res = await Requests().loginUser(data, "/request/createAccount");

        res = jsonDecode(res.body);
        if(res['success']){
          setState(() {
            isLoading = false;
            Navigator.push(context, Transition(child: const RegisterCraftManThree(), transitionEffect: TransitionEffect.BOTTOM_TO_TOP));
          });
        } else {
          try {
            response = res['message'];
            isLoading = false;
          } catch(e){
            response = e.toString();
            isLoading = false;
          }

        }
      } else {
        response = "Both passwords don't match. Correct this error";
      }
    } else{
      errorText = "Enter password";
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PreviousPage(icon: Icons.keyboard_arrow_down, color: ThemeColor.black),
              const SizedBox(height: 100,),
              const HeaderText(text: "Password"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(child: DescriptionText(text: "Set password to protect your account from being accessed randomly.")),
                  Text('2 / 5',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 10
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              CustomAlert(infoText: response),
              CustomInput(
                labelText: 'Password',
                inputAction: TextInputAction.next,
                inputController: passwordController,
                inputType: TextInputType.text,
                icon: Icons.lock,
                inputError: errorText,
                isPassword: true,
              ),
              const SizedBox(height: 10),
              CustomInput(
                labelText: 'Confirm Password',
                inputAction: TextInputAction.done,
                inputController: passwordConfirmController,
                inputType: TextInputType.text,
                icon: Icons.lock,
                inputError: "",
                isPassword: true,
              )

            ],
          ),
        ),
      ),
      backgroundColor: ThemeColor.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
            onTap: () {
              setState(() {
                setPassword();
              });
            },
            child: SubmitButton(text: "Next", isLoading: isLoading)
        ),
      ),
    );
  }
}
