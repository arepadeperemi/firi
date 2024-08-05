import 'dart:convert';

import 'package:craftmani/views/authenticate/register_client_3.dart';
import 'package:flutter/material.dart';
import 'package:craftmani/exports.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:transition/transition.dart';

import '../../api/convert.dart';



class RegisterClientPassword extends StatefulWidget {
  const RegisterClientPassword({Key? key}) : super(key: key);

  @override
  State<RegisterClientPassword> createState() => _RegisterClientPasswordState();
}

class _RegisterClientPasswordState extends State<RegisterClientPassword> {
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
            Navigator.push(context, Transition(child: const RegisterClientTwo(), transitionEffect: TransitionEffect.BOTTOM_TO_TOP));
          });
        } else {
          try {
            response = res['message'];
          } catch(e){
            response = e.toString();
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: DescriptionText(text: "Set password to protect your account from being accessed randomly.")),
                  Text('2 / 3',
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
