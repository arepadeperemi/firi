import 'dart:convert';

import 'package:country_picker/country_picker.dart';
import 'package:craftmani/exports.dart';
import 'package:craftmani/views/app_home/pages/client_home.dart';
import 'package:craftmani/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:transition/transition.dart';

import '../../api/request.dart';

class RegisterClientTwo extends StatefulWidget {

  const RegisterClientTwo({Key? key}) : super(key: key);

  @override
  State<RegisterClientTwo> createState() => _RegisterClientThreeState();
}

class _RegisterClientThreeState extends State<RegisterClientTwo> {
  TextEditingController phoneController = TextEditingController();

  var errorText = "";
  var isLoading = false;
  var countryName = "";
  var countryFlag = "";
  var countryCode = "";
  var countrycode = "";

  setPhone(country, code) async {

    try{

      if(phoneController.text != "" && countryCode != ""){
        isLoading = true;
        errorText = "";
        var data = {
          "action" : "update_account_phone",
          "country": country,
          "country_code": countrycode,
          "phone_code": code,
          'table': 'user_basic_dt',
          'phone': phoneController.text,
          'user_id': await SessionManager().get("user_id")
        };
        var res = await Requests().loginUser(data, "/request/createAccount");
        res = jsonDecode(res.body);
        if(res['success']){
          await SessionManager().set("user_token", await SessionManager().get("user_id"));
          await SessionManager().remove("user_id");
          setState(() {
            isLoading = false;
            Navigator.push(context, Transition(child: const ClientHome(), transitionEffect: TransitionEffect.BOTTOM_TO_TOP));
          });
        } else{
          isLoading = false;
        }
      } else {
        errorText = "Enter valid phone number and country";
      }

    } catch(e){
      errorText = e.toString();
    }

  }

  @override
  void dispose(){

    super.dispose();
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
              HeaderText(text: "Phone Number"),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(child: DescriptionText(text: "To continue please enter a valid phone number craft men can reach you on")),
                  SizedBox(width: 10),
                  Text('3 / 3',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 10
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => {
                      showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          margin: EdgeInsets.only(top: 40),
                          inputDecoration: InputDecoration(
                              prefixIcon: Icon(Icons.search)
                          ),
                        ),
                        useSafeArea: true,
                        onSelect: (Country value) {
                          setState(() {
                            countryName = value.name;
                            countryCode = "+${value.phoneCode}";
                            countrycode = value.countryCode;
                            countryFlag = value.flagEmoji;
                          });
                        },
                      )
                    },
                    child: Container(
                      width: 75,
                      margin: EdgeInsets.only(top: 18),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: ThemeColor.black.withOpacity(0.6), width: 0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: countryCode == "" ?
                      const Icon(Icons.keyboard_arrow_down_outlined) :
                      Row(
                        children: [
                          Text(countryFlag),
                          const SizedBox(width: 5),
                          Text(countryCode,
                              style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 10
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomInput(
                      labelText: 'Phone',
                      inputAction: TextInputAction.done,
                      inputController: phoneController,
                      inputType: TextInputType.phone,
                      icon: Icons.call,
                      inputError: errorText,
                    ),
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
                setPhone(countryName, countryCode);
              });
            },
            child: SubmitButton(text: "Next", isLoading: isLoading)
        ),
      ),
    );
  }
}