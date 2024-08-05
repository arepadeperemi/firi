import 'dart:convert';

import 'package:country_picker/country_picker.dart';
import 'package:craftmani/exports.dart';
import 'package:craftmani/views/authenticate/register_craftman_4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:transition/transition.dart';


class RegisterCraftManThree extends StatefulWidget {

  const RegisterCraftManThree({Key? key}) : super(key: key);

  @override
  State<RegisterCraftManThree> createState() => _RegisterCraftManThreeState();
}

class _RegisterCraftManThreeState extends State<RegisterCraftManThree> {
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

          setState(() {
            isLoading = false;
            Navigator.push(context, Transition(child: const RegisterCraftManFour(), transitionEffect: TransitionEffect.BOTTOM_TO_TOP));
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PreviousPage(icon: Icons.keyboard_arrow_down, color: ThemeColor.black),
            const SizedBox(height: 100,),
            const HeaderText(text: "Phone Number"),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: DescriptionText(text: "To continue please enter a valid phone number clients can reach you on")),
                SizedBox(width: 10),
                Text('3 / 5',
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
                      countryListTheme: const CountryListThemeData(
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
                    margin: const EdgeInsets.only(top: 18),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
