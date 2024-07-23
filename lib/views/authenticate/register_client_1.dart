import 'dart:convert';

import 'package:craftmani/exports.dart';
import 'package:craftmani/views/authenticate/register_client_3.dart';
import 'package:craftmani/views/authenticate/register_client_2.dart';
import 'package:craftmani/views/authenticate/register_craftman_3.dart';
import 'package:craftmani/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:transition/transition.dart';

import '../../api/request.dart';

class RegisterClientOne extends StatefulWidget {

  const RegisterClientOne({Key? key}) : super(key: key);

  @override
  State<RegisterClientOne> createState() => _RegisterClientOneState();
}

class _RegisterClientOneState extends State<RegisterClientOne> {
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
            Navigator.push(context, Transition(child: const RegisterClientPassword(), transitionEffect: TransitionEffect.BOTTOM_TO_TOP));
          });
        } else{
          isLoading = false;
        }
      } else {
        errorText = "Enter your full name";
      }

    } catch(e){

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PreviousPage(icon: Icons.keyboard_arrow_down, color: ThemeColor.black),
              SizedBox(height: 100,),
              HeaderText(text: "Hello Client"),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(child: DescriptionText(text: "Please proceed to enter your full name")),
                  Text('1 / 3',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 10
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
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
