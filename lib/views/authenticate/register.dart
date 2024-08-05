import 'dart:convert';
import 'package:craftmani/views/authenticate/register_client_1.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:craftmani/exports.dart';
import 'package:craftmani/views/authenticate/register_craftman_1.dart';
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';

class RegisterOne extends StatefulWidget {
  const RegisterOne({Key? key}) : super(key: key);

  @override
  State<RegisterOne> createState() => _RegisterOneState();
}

class _RegisterOneState extends State<RegisterOne> {

  TextEditingController optionField = TextEditingController();

  List options = [
    'I am a Craft man',
    'I want to hire a craft man'
  ];

  int selected = 2;
  String selectValue = "";
  var isLoading = false;
  String info = "";

  selectedValue(index){

    setState(() {
      selected = index;
    });
    switch(selected){
      case 0:
        selectValue = "isCraftman";
        break;
      case 1:
        selectValue = "isNotCraftman";
        break;
      default:
        selectValue = "";
    }
  }

  validateAccountType() async {
    try {
      final stamp = DateTime.now().millisecondsSinceEpoch;
      var userId = "${selectValue}_$stamp";

      await SessionManager().set("user_id", userId);

      if(selectValue != ""){
        isLoading = true;
        var data = {
          'action': 'create_account',
          'account_type': selectValue,
          'user_id': await SessionManager().get("user_id")
        };

        var res = await Requests().loginUser(data, "/request/createAccount");
        res = jsonDecode(res.body);
        if(res['success']){
          setState(() {
            isLoading = false;
            if(selectValue == "isCraftman" || selectValue == "isNotCraftman"){
              if(selectValue == "isCraftman"){
                Navigator.push(context, Transition(child: const RegisterCraftManOne(),
                    transitionEffect: TransitionEffect.BOTTOM_TO_TOP)
                );
              } else {
                Navigator.push(context, Transition(child: const RegisterClientOne(),
                    transitionEffect: TransitionEffect.BOTTOM_TO_TOP)
                );
              }
            } else{
              throw Exception("No valid option selected");
            }
          });
        } else {
          isLoading = false;
          throw Exception(res['data']['message']);
        }
      } else {
        info = "Select an option to continue";
      }

    } catch(e){
      setState((){
        info = e.toString();
      });
      isLoading = false;
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
            const HeaderText(text: "Choose Account Option"),
            const SizedBox(height: 10),
            const DescriptionText(text: "Are you a craftman or you're looking to hire one for a job?"),
            const SizedBox(height: 40),
            CustomAlert(infoText: info),
            Expanded(
                child: Center(
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => {
                          selectedValue(index)
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ThemeColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: ThemeColor.black.withOpacity(0.1),
                                offset: const Offset(-1, 5),
                                blurRadius: 8,
                              )
                            ],
                            border: Border.all(
                            color: selected == index ? ThemeColor.primary : Colors.transparent,
                              width: 0.7
                            )
                          ),
                          child: Row(
                            children: [
                              Icon(selected == index ? Icons.check_circle_rounded : Icons.check_circle_outline_sharp,
                                size: 16,
                                color: selected == index ? ThemeColor.primary : ThemeColor.black,
                              ),
                              const SizedBox(width: 10,),
                              Text(options[index],
                                style: const TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  fontFamily: "Poppins"
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (_, index) => const SizedBox(height: 10),
                      itemCount: options.length
                  ),
                )
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
            onTap: () {
              setState(() {
                validateAccountType();
              });
            },
            child: SubmitButton(text: "Next", isLoading: isLoading)
        ),
      ),
    );
  }
}
