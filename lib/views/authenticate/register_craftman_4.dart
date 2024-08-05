import 'dart:convert';
import 'package:craftmani/exports.dart';
import 'package:craftmani/views/authenticate/register_craftman_5.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:transition/transition.dart';


class RegisterCraftManFour extends StatefulWidget {

  const RegisterCraftManFour({Key? key}) : super(key: key);

  @override
  State<RegisterCraftManFour> createState() => _RegisterCraftManFourState();
}

class _RegisterCraftManFourState extends State<RegisterCraftManFour> {

  List crafts = ['Select Craft'];
  var isFetching = true;
  String error = "Please wait...";
  var selected = "";
  bool isLoading = false;

  void requestData() async {

    var data = {
      'request': 'craftMan'
    };
    var res = await Requests().loginUser(data, "/request/craftmen");
    res = jsonDecode(res.body);

    if(res['success']){
      isFetching = false;
      setState(() {
        crafts = res['data'];
        selected = crafts[0];
      });
    } else {
      setState(() {
        try {

        } catch(e) {
          error = e.toString();
        }
      });
    }


  }

  void completeCraftMan() async {

    if(selected != ""){
      isLoading = true;
      var data = {
        "action" : "update_account",
        "key": "craft_type",
        'table': 'user_basic_dt',
        'value': selected,
        'user_id': await SessionManager().get("user_id")
      };
      var res = await Requests().loginUser(data, "/request/createAccount");
      res = jsonDecode(res.body);
      if(res['success']){
        setState(() {
          isLoading = false;
          Navigator.push(context, Transition(child: const RegisterCraftManFive(), transitionEffect: TransitionEffect.BOTTOM_TO_TOP));
        });
      } else {
        null;
      }
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestData();
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
            const HeaderText(text: "Select Craft"),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: DescriptionText(text: "We understand you are a craftman. Please what is your craft?")),
                SizedBox(width: 10),
                Text('4 / 5',
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),
            isFetching ? SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Lottie.asset('assets/lottie/waiter_loader.json',
              width: 200, height: 100),
            ) : Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  margin: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ThemeColor.black.withOpacity(0.4), width: 0.5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          value: selected,
                          decoration: const InputDecoration(
                            border: InputBorder.none
                          ),
                          items: crafts.map((item) =>
                              DropdownMenuItem(
                                  value: item,
                                  child: Text(item, overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12
                                      )
                                  ),
                              ),
                          ).toList(),
                          onChanged: (value) {
                            setState(() {
                              selected = value.toString();
                            });
                          }
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(left: 30),
                  color: ThemeColor.white,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.pan_tool,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Text('I am a',
                        style: TextStyle(
                          fontSize: 12,
                        )
                      ),
                    ],
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
                completeCraftMan();
              });
            },
            child: SubmitButton(text: "Next", isLoading: isLoading)
        ),
      ),
    );
  }
}
